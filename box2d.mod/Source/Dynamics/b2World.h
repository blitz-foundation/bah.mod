/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/

#ifndef B2_WORLD_H
#define B2_WORLD_H

#include "../Common/b2Math.h"
#include "../Common/b2BlockAllocator.h"
#include "../Common/b2StackAllocator.h"
#include "b2ContactManager.h"
#include "b2WorldCallbacks.h"

struct b2AABB;
struct b2ShapeDef;
struct b2BodyDef;
struct b2JointDef;
class b2Body;
class b2Joint;
class b2Shape;
class b2Contact;
class b2BroadPhase;

struct b2TimeStep
{
	float32 dt;			// time step
	float32 inv_dt;		// inverse time step (0 if dt == 0).
	float32 dtRatio;	// dt * inv_dt0
	int32 maxIterations;
	bool warmStarting;
	bool positionCorrection;
};

/// The world class manages all physics entities, dynamic simulation,
/// and asynchronous queries. The world also contains efficient memory
/// management facilities.
class b2World
{
public:
	/// Construct a world object.
	/// @param worldAABB a bounding box that completely encompasses all your shapes.
	/// @param gravity the world gravity vector.
	/// @param doSleep improve performance by not simulating inactive bodies.
	b2World(const b2AABB& worldAABB, const b2Vec2& gravity, bool doSleep);

	/// Destruct the world. All physics entities are destroyed and all heap memory is released.
	~b2World();

	/// Register a destruction listener.
	void SetListener(b2DestructionListener* listener);

	/// Register a broad-phase boundary listener.
	void SetListener(b2BoundaryListener* listener);

	/// Register a contact filter to provide specific control over collision.
	/// Otherwise the default filter is used (b2_defaultFilter).
	void SetFilter(b2ContactFilter* filter);

	/// Register a contact event listener
	void SetListener(b2ContactListener* listener);

	/// Register a routine for debug drawing. The debug draw functions are called
	/// inside the b2World::Step method, so make sure your renderer is ready to
	/// consume draw commands when you call Step().
	void SetDebugDraw(b2DebugDraw* debugDraw);

	/// Create a static rigid body given a definition. No reference to the definition
	/// is retained.
	/// @warning This function is locked during callbacks.
	b2Body* CreateStaticBody(const b2BodyDef* def);

	/// Create a dynamic rigid body given a definition. No reference to the definition
	/// is retained.
	/// @warning This function is locked during callbacks.
	b2Body* CreateDynamicBody(const b2BodyDef* def);

	/// Destroy a rigid body given a definition. No reference to the definition
	/// is retained. This function is locked during callbacks.
	/// @warning This automatically deletes all associated shapes and joints.
	/// @warning This function is locked during callbacks.
	void DestroyBody(b2Body* body);

	/// Create a joint to constrain bodies together. No reference to the definition
	/// is retained. This may cause the connected bodies to cease colliding.
	/// @warning This function is locked during callbacks.
	b2Joint* CreateJoint(const b2JointDef* def);

	/// Destroy a joint. This may cause the connected bodies to begin colliding.
	/// @warning This function is locked during callbacks.
	void DestroyJoint(b2Joint* joint);

	/// The world provides a single static ground body with no collision shapes.
	/// You can use this to simplify the creation of joints and static shapes.
	b2Body* GetGroundBody();

	/// Take a time step. This performs collision detection, integration,
	/// and constraint solution.
	/// @param timeStep the amount of time to simulate, this should not vary.
	/// @param iterations the number of iterations to be used by the constraint solver.
	void Step(float32 timeStep, int32 iterations);

	/// Query the world for all shapes that potentially overlap the
	/// provided AABB. You provide a shape pointer buffer of specified
	/// size. The number of shapes found is returned.
	/// @param aabb the query box.
	/// @param shapes a user allocated shape pointer array of size maxCount (or greater).
	/// @param maxCount the capacity of the shapes array.
	/// @return the number of shapes found in aabb.
	int32 Query(const b2AABB& aabb, b2Shape** shapes, int32 maxCount);

	/// Get the world body list. With the returned body, use b2Body::GetNext to get
	/// the next body in the world list. A NULL body indicates the end of the list.
	/// @return the head of the world body list.
	b2Body* GetBodyList();

	/// Get the world joint list. With the returned joint, use b2Joint::GetNext to get
	/// the next joint in the world list. A NULL joint indicates the end of the list.
	/// @return the head of the world joint list.
	b2Joint* GetJointList();

	void SetWarmStarting(bool flag) { m_warmStarting = flag; }

	void SetPositionCorrection(bool flag) { m_positionCorrection = flag; }

	void SetContinuousPhysics(bool flag) { m_continuousPhysics = flag; }

	void Validate();

	int32 GetProxyCount() const;

	int32 GetPairCount() const;

	int32 GetBodyCount() const;

	int32 GetJointCount() const;

	int32 GetContactCount() const;

	void SetGravity(const b2Vec2& gravity);

	//--------------- Internals Below -------------------
private:

	friend class b2Body;
	friend class b2ContactManager;
	friend class b2ContactSolver;
	friend class b2DistanceJoint;
	friend class b2GearJoint;
	friend class b2MouseJoint;
	friend class b2PrismaticJoint;
	friend class b2PulleyJoint;
	friend class b2RevoluteJoint;

	void Solve(const b2TimeStep& step);
	void SolveTOI(const b2TimeStep& step);

	void DrawJoint(b2Joint* joint);
	void DrawShape(b2Shape* shape, const b2XForm& xf, const b2Color& color, bool core);
	void DrawDebugData();

	b2BlockAllocator m_blockAllocator;
	b2StackAllocator m_stackAllocator;

	bool m_lock;

	b2BroadPhase* m_broadPhase;
	b2ContactManager m_contactManager;

	b2Body* m_bodyList;
	b2Joint* m_jointList;

	// Do not access
	b2Contact* m_contactList;

	int32 m_bodyCount;
	int32 m_contactCount;
	int32 m_jointCount;

	b2Vec2 m_gravity;
	bool m_allowSleep;

	b2Body* m_groundBody;

	b2DestructionListener* m_destructionListener;
	b2BoundaryListener* m_boundaryListener;
	b2ContactFilter* m_contactFilter;
	b2ContactListener* m_contactListener;
	b2DebugDraw* m_debugDraw;

	float32 m_inv_dt0;

	int32 m_positionIterationCount;

	// This is for debugging the solver.
	bool m_positionCorrection;

	// This is for debugging the solver.
	bool m_warmStarting;

	// This is for debugging the solver.
	bool m_continuousPhysics;
};

inline b2Body* b2World::GetGroundBody()
{
	return m_groundBody;
}

inline b2Body* b2World::GetBodyList()
{
	return m_bodyList;
}

inline b2Joint* b2World::GetJointList()
{
	return m_jointList;
}

inline int32 b2World::GetBodyCount() const
{
	return m_bodyCount;
}

inline int32 b2World::GetJointCount() const
{
	return m_jointCount;
}

inline int32 b2World::GetContactCount() const
{
	return m_contactCount;
}

inline void b2World::SetGravity(const b2Vec2& gravity)
{
	m_gravity = gravity;
}

#endif