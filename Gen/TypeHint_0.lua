---@meta

---@meta CSharp

---@class NotExportType @表明该类型未导出

---@class NotExportEnum @表明该枚举未导出

---@class CS
CS = {}

---@param obj any
---@return System.Type
function typeof(obj) end

---@class UnityEngine
UnityEngine = {}
---@alias CS.UnityEngine UnityEngine
CS.UnityEngine = {}

---@class Empty
Empty = {}
---@alias CS.Empty Empty
CS.Empty = {}

---@class Empty.Test
Empty.Test = {}
---@alias CS.Empty.Test Empty.Test
CS.Empty.Test = {}

---@class UnityEngine.GameObject : UnityEngine.Object
---@field transform UnityEngine.Transform
---@field layer number
---@field activeSelf boolean
---@field activeInHierarchy boolean
---@field isStatic boolean
---@field tag string
---@field scene UnityEngine.SceneManagement.Scene
---@field sceneCullingMask number
---@field gameObject UnityEngine.GameObject
UnityEngine.GameObject = {}
---@alias CS.UnityEngine.GameObject UnityEngine.GameObject
CS.UnityEngine.GameObject = UnityEngine.GameObject

---@overload fun(name: string) : UnityEngine.GameObject
---@overload fun() : UnityEngine.GameObject
---@param name string
---@param components System.Type[]
---@return UnityEngine.GameObject
function UnityEngine.GameObject.New(name, components) end
---@param type UnityEngine.PrimitiveType
---@return UnityEngine.GameObject
function UnityEngine.GameObject.CreatePrimitive(type) end
---@param tag string
---@return UnityEngine.GameObject
function UnityEngine.GameObject.FindWithTag(tag) end
---@overload fun(tag: string, results: System.Collections.Generic.List)
---@param tag string
---@return UnityEngine.GameObject[]
function UnityEngine.GameObject.FindGameObjectsWithTag(tag) end
---@param tag string
---@return UnityEngine.GameObject
function UnityEngine.GameObject.FindGameObjectWithTag(tag) end
---@param name string
---@return UnityEngine.GameObject
function UnityEngine.GameObject.Find(name) end
---@overload fun(instanceIDs: Unity.Collections.NativeArray, active: boolean)
---@param instanceIDs System.ReadOnlySpan
---@param active boolean
function UnityEngine.GameObject.SetGameObjectsActive(instanceIDs, active) end
---@param sourceInstanceID number
---@param count number
---@param newInstanceIDs Unity.Collections.NativeArray
---@param newTransformInstanceIDs Unity.Collections.NativeArray
---@param destinationScene UnityEngine.SceneManagement.Scene
function UnityEngine.GameObject.InstantiateGameObjects(sourceInstanceID, count, newInstanceIDs, newTransformInstanceIDs, destinationScene) end
---@param instanceID number
---@return UnityEngine.SceneManagement.Scene
function UnityEngine.GameObject.GetScene(instanceID) end
---@overload fun(self: UnityEngine.GameObject, type: System.Type) : UnityEngine.Component
---@param type string
---@return UnityEngine.Component
function UnityEngine.GameObject:GetComponent(type) end
---@overload fun(self: UnityEngine.GameObject, type: System.Type, includeInactive: boolean) : UnityEngine.Component
---@param type System.Type
---@return UnityEngine.Component
function UnityEngine.GameObject:GetComponentInChildren(type) end
---@overload fun(self: UnityEngine.GameObject, type: System.Type, includeInactive: boolean) : UnityEngine.Component
---@param type System.Type
---@return UnityEngine.Component
function UnityEngine.GameObject:GetComponentInParent(type) end
---@overload fun(self: UnityEngine.GameObject, type: System.Type) : UnityEngine.Component[]
---@param type System.Type
---@param results System.Collections.Generic.List
function UnityEngine.GameObject:GetComponents(type, results) end
---@overload fun(self: UnityEngine.GameObject, type: System.Type) : UnityEngine.Component[]
---@param type System.Type
---@param includeInactive boolean
---@return UnityEngine.Component[]
function UnityEngine.GameObject:GetComponentsInChildren(type, includeInactive) end
---@overload fun(self: UnityEngine.GameObject, type: System.Type) : UnityEngine.Component[]
---@param type System.Type
---@param includeInactive boolean
---@return UnityEngine.Component[]
function UnityEngine.GameObject:GetComponentsInParent(type, includeInactive) end
---@param type System.Type
---@return boolean, UnityEngine.Component
function UnityEngine.GameObject:TryGetComponent(type, ) end
---@overload fun(self: UnityEngine.GameObject, methodName: string, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.GameObject, methodName: string, value: System.Object, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.GameObject, methodName: string, value: System.Object)
---@param methodName string
function UnityEngine.GameObject:SendMessageUpwards(methodName) end
---@overload fun(self: UnityEngine.GameObject, methodName: string, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.GameObject, methodName: string, value: System.Object, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.GameObject, methodName: string, value: System.Object)
---@param methodName string
function UnityEngine.GameObject:SendMessage(methodName) end
---@overload fun(self: UnityEngine.GameObject, methodName: string, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.GameObject, methodName: string, parameter: System.Object, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.GameObject, methodName: string, parameter: System.Object)
---@param methodName string
function UnityEngine.GameObject:BroadcastMessage(methodName) end
---@param componentType System.Type
---@return UnityEngine.Component
function UnityEngine.GameObject:AddComponent(componentType) end
---@return number
function UnityEngine.GameObject:GetComponentCount() end
---@param index number
---@return UnityEngine.Component
function UnityEngine.GameObject:GetComponentAtIndex(index) end
---@param component UnityEngine.Component
---@return number
function UnityEngine.GameObject:GetComponentIndex(component) end
---@param value boolean
function UnityEngine.GameObject:SetActive(value) end
---@overload fun(self: UnityEngine.GameObject, tag: string) : boolean
---@param tag UnityEngine.TagHandle
---@return boolean
function UnityEngine.GameObject:CompareTag(tag) end

---@class UnityEngine.Transform : UnityEngine.Component & System.Collections.IEnumerable
---@field position UnityEngine.Vector3
---@field localPosition UnityEngine.Vector3
---@field eulerAngles UnityEngine.Vector3
---@field localEulerAngles UnityEngine.Vector3
---@field right UnityEngine.Vector3
---@field up UnityEngine.Vector3
---@field forward UnityEngine.Vector3
---@field rotation UnityEngine.Quaternion
---@field localRotation UnityEngine.Quaternion
---@field localScale UnityEngine.Vector3
---@field parent UnityEngine.Transform
---@field worldToLocalMatrix UnityEngine.Matrix4x4
---@field localToWorldMatrix UnityEngine.Matrix4x4
---@field root UnityEngine.Transform
---@field childCount number
---@field lossyScale UnityEngine.Vector3
---@field hasChanged boolean
---@field hierarchyCapacity number
---@field hierarchyCount number
UnityEngine.Transform = {}
---@alias CS.UnityEngine.Transform UnityEngine.Transform
CS.UnityEngine.Transform = UnityEngine.Transform

---@overload fun(self: UnityEngine.Transform, p: UnityEngine.Transform)
---@param parent UnityEngine.Transform
---@param worldPositionStays boolean
function UnityEngine.Transform:SetParent(parent, worldPositionStays) end
---@param position UnityEngine.Vector3
---@param rotation UnityEngine.Quaternion
function UnityEngine.Transform:SetPositionAndRotation(position, rotation) end
---@param localPosition UnityEngine.Vector3
---@param localRotation UnityEngine.Quaternion
function UnityEngine.Transform:SetLocalPositionAndRotation(localPosition, localRotation) end
---@return UnityEngine.Vector3, UnityEngine.Quaternion
function UnityEngine.Transform:GetPositionAndRotation() end
---@return UnityEngine.Vector3, UnityEngine.Quaternion
function UnityEngine.Transform:GetLocalPositionAndRotation() end
---@overload fun(self: UnityEngine.Transform, translation: UnityEngine.Vector3, relativeTo: UnityEngine.Space)
---@overload fun(self: UnityEngine.Transform, translation: UnityEngine.Vector3)
---@overload fun(self: UnityEngine.Transform, x: number, y: number, z: number, relativeTo: UnityEngine.Space)
---@overload fun(self: UnityEngine.Transform, x: number, y: number, z: number)
---@overload fun(self: UnityEngine.Transform, translation: UnityEngine.Vector3, relativeTo: UnityEngine.Transform)
---@param x number
---@param y number
---@param z number
---@param relativeTo UnityEngine.Transform
function UnityEngine.Transform:Translate(x, y, z, relativeTo) end
---@overload fun(self: UnityEngine.Transform, eulers: UnityEngine.Vector3, relativeTo: UnityEngine.Space)
---@overload fun(self: UnityEngine.Transform, eulers: UnityEngine.Vector3)
---@overload fun(self: UnityEngine.Transform, xAngle: number, yAngle: number, zAngle: number, relativeTo: UnityEngine.Space)
---@overload fun(self: UnityEngine.Transform, xAngle: number, yAngle: number, zAngle: number)
---@overload fun(self: UnityEngine.Transform, axis: UnityEngine.Vector3, angle: number, relativeTo: UnityEngine.Space)
---@param axis UnityEngine.Vector3
---@param angle number
function UnityEngine.Transform:Rotate(axis, angle) end
---@param point UnityEngine.Vector3
---@param axis UnityEngine.Vector3
---@param angle number
function UnityEngine.Transform:RotateAround(point, axis, angle) end
---@overload fun(self: UnityEngine.Transform, target: UnityEngine.Transform, worldUp: UnityEngine.Vector3)
---@overload fun(self: UnityEngine.Transform, target: UnityEngine.Transform)
---@overload fun(self: UnityEngine.Transform, worldPosition: UnityEngine.Vector3, worldUp: UnityEngine.Vector3)
---@param worldPosition UnityEngine.Vector3
function UnityEngine.Transform:LookAt(worldPosition) end
---@overload fun(self: UnityEngine.Transform, direction: UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine.Transform:TransformDirection(x, y, z) end
---@overload fun(self: UnityEngine.Transform, directions: System.ReadOnlySpan, transformedDirections: System.Span)
---@param directions System.Span
function UnityEngine.Transform:TransformDirections(directions) end
---@overload fun(self: UnityEngine.Transform, direction: UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine.Transform:InverseTransformDirection(x, y, z) end
---@overload fun(self: UnityEngine.Transform, directions: System.ReadOnlySpan, transformedDirections: System.Span)
---@param directions System.Span
function UnityEngine.Transform:InverseTransformDirections(directions) end
---@overload fun(self: UnityEngine.Transform, vector: UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine.Transform:TransformVector(x, y, z) end
---@overload fun(self: UnityEngine.Transform, vectors: System.ReadOnlySpan, transformedVectors: System.Span)
---@param vectors System.Span
function UnityEngine.Transform:TransformVectors(vectors) end
---@overload fun(self: UnityEngine.Transform, vector: UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine.Transform:InverseTransformVector(x, y, z) end
---@overload fun(self: UnityEngine.Transform, vectors: System.ReadOnlySpan, transformedVectors: System.Span)
---@param vectors System.Span
function UnityEngine.Transform:InverseTransformVectors(vectors) end
---@overload fun(self: UnityEngine.Transform, position: UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine.Transform:TransformPoint(x, y, z) end
---@overload fun(self: UnityEngine.Transform, positions: System.ReadOnlySpan, transformedPositions: System.Span)
---@param positions System.Span
function UnityEngine.Transform:TransformPoints(positions) end
---@overload fun(self: UnityEngine.Transform, position: UnityEngine.Vector3) : UnityEngine.Vector3
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3
function UnityEngine.Transform:InverseTransformPoint(x, y, z) end
---@overload fun(self: UnityEngine.Transform, positions: System.ReadOnlySpan, transformedPositions: System.Span)
---@param positions System.Span
function UnityEngine.Transform:InverseTransformPoints(positions) end
function UnityEngine.Transform:DetachChildren() end
function UnityEngine.Transform:SetAsFirstSibling() end
function UnityEngine.Transform:SetAsLastSibling() end
---@param index number
function UnityEngine.Transform:SetSiblingIndex(index) end
---@return number
function UnityEngine.Transform:GetSiblingIndex() end
---@param n string
---@return UnityEngine.Transform
function UnityEngine.Transform:Find(n) end
---@param parent UnityEngine.Transform
---@return boolean
function UnityEngine.Transform:IsChildOf(parent) end
---@return System.Collections.IEnumerator
function UnityEngine.Transform:GetEnumerator() end
---@param index number
---@return UnityEngine.Transform
function UnityEngine.Transform:GetChild(index) end

---@class UnityEngine.Component : UnityEngine.Object
---@field transform UnityEngine.Transform
---@field gameObject UnityEngine.GameObject
---@field tag string
UnityEngine.Component = {}
---@alias CS.UnityEngine.Component UnityEngine.Component
CS.UnityEngine.Component = UnityEngine.Component

---@return UnityEngine.Component
function UnityEngine.Component.New() end
---@overload fun(self: UnityEngine.Component, type: System.Type) : UnityEngine.Component
---@param type string
---@return UnityEngine.Component
function UnityEngine.Component:GetComponent(type) end
---@param type System.Type
---@return boolean, UnityEngine.Component
function UnityEngine.Component:TryGetComponent(type, ) end
---@overload fun(self: UnityEngine.Component, t: System.Type, includeInactive: boolean) : UnityEngine.Component
---@param t System.Type
---@return UnityEngine.Component
function UnityEngine.Component:GetComponentInChildren(t) end
---@overload fun(self: UnityEngine.Component, t: System.Type, includeInactive: boolean) : UnityEngine.Component[]
---@param t System.Type
---@return UnityEngine.Component[]
function UnityEngine.Component:GetComponentsInChildren(t) end
---@overload fun(self: UnityEngine.Component, t: System.Type, includeInactive: boolean) : UnityEngine.Component
---@param t System.Type
---@return UnityEngine.Component
function UnityEngine.Component:GetComponentInParent(t) end
---@overload fun(self: UnityEngine.Component, t: System.Type, includeInactive: boolean) : UnityEngine.Component[]
---@param t System.Type
---@return UnityEngine.Component[]
function UnityEngine.Component:GetComponentsInParent(t) end
---@overload fun(self: UnityEngine.Component, type: System.Type) : UnityEngine.Component[]
---@param type System.Type
---@param results System.Collections.Generic.List
function UnityEngine.Component:GetComponents(type, results) end
---@return number
function UnityEngine.Component:GetComponentIndex() end
---@overload fun(self: UnityEngine.Component, tag: string) : boolean
---@param tag UnityEngine.TagHandle
---@return boolean
function UnityEngine.Component:CompareTag(tag) end
---@overload fun(self: UnityEngine.Component, methodName: string, value: System.Object, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.Component, methodName: string, value: System.Object)
---@overload fun(self: UnityEngine.Component, methodName: string)
---@param methodName string
---@param options UnityEngine.SendMessageOptions
function UnityEngine.Component:SendMessageUpwards(methodName, options) end
---@overload fun(self: UnityEngine.Component, methodName: string, value: System.Object)
---@overload fun(self: UnityEngine.Component, methodName: string)
---@overload fun(self: UnityEngine.Component, methodName: string, value: System.Object, options: UnityEngine.SendMessageOptions)
---@param methodName string
---@param options UnityEngine.SendMessageOptions
function UnityEngine.Component:SendMessage(methodName, options) end
---@overload fun(self: UnityEngine.Component, methodName: string, parameter: System.Object, options: UnityEngine.SendMessageOptions)
---@overload fun(self: UnityEngine.Component, methodName: string, parameter: System.Object)
---@overload fun(self: UnityEngine.Component, methodName: string)
---@param methodName string
---@param options UnityEngine.SendMessageOptions
function UnityEngine.Component:BroadcastMessage(methodName, options) end

---@class UnityEngine.Behaviour : UnityEngine.Component
---@field enabled boolean
---@field isActiveAndEnabled boolean
UnityEngine.Behaviour = {}
---@alias CS.UnityEngine.Behaviour UnityEngine.Behaviour
CS.UnityEngine.Behaviour = UnityEngine.Behaviour

---@return UnityEngine.Behaviour
function UnityEngine.Behaviour.New() end

---@class UnityEngine.MonoBehaviour : UnityEngine.Behaviour
---@field destroyCancellationToken System.Threading.CancellationToken
---@field useGUILayout boolean
---@field didStart boolean
---@field didAwake boolean
---@field runInEditMode boolean
UnityEngine.MonoBehaviour = {}
---@alias CS.UnityEngine.MonoBehaviour UnityEngine.MonoBehaviour
CS.UnityEngine.MonoBehaviour = UnityEngine.MonoBehaviour

---@param message System.Object
function UnityEngine.MonoBehaviour.print(message) end
---@overload fun() : boolean
---@param methodName string
---@return boolean
function UnityEngine.MonoBehaviour:IsInvoking(methodName) end
---@overload fun()
---@param methodName string
function UnityEngine.MonoBehaviour:CancelInvoke(methodName) end
---@param methodName string
---@param time number
function UnityEngine.MonoBehaviour:Invoke(methodName, time) end
---@param methodName string
---@param time number
---@param repeatRate number
function UnityEngine.MonoBehaviour:InvokeRepeating(methodName, time, repeatRate) end
---@overload fun(self: UnityEngine.MonoBehaviour, methodName: string) : UnityEngine.Coroutine
---@overload fun(self: UnityEngine.MonoBehaviour, methodName: string, value: System.Object) : UnityEngine.Coroutine
---@param routine System.Collections.IEnumerator
---@return UnityEngine.Coroutine
function UnityEngine.MonoBehaviour:StartCoroutine(routine) end
---@overload fun(self: UnityEngine.MonoBehaviour, routine: System.Collections.IEnumerator)
---@overload fun(self: UnityEngine.MonoBehaviour, routine: UnityEngine.Coroutine)
---@param methodName string
function UnityEngine.MonoBehaviour:StopCoroutine(methodName) end
function UnityEngine.MonoBehaviour:StopAllCoroutines() end

---@class UnityEngine.Vector3 : System.ValueType & System.IFormattable & System.IEquatable
---@field kEpsilon number
---@field kEpsilonNormalSqrt number
---@field x number
---@field y number
---@field z number
---@field zero UnityEngine.Vector3
---@field one UnityEngine.Vector3
---@field forward UnityEngine.Vector3
---@field back UnityEngine.Vector3
---@field up UnityEngine.Vector3
---@field down UnityEngine.Vector3
---@field left UnityEngine.Vector3
---@field right UnityEngine.Vector3
---@field positiveInfinity UnityEngine.Vector3
---@field negativeInfinity UnityEngine.Vector3
---@field Item number
---@field normalized UnityEngine.Vector3
---@field magnitude number
---@field sqrMagnitude number
UnityEngine.Vector3 = {}
---@alias CS.UnityEngine.Vector3 UnityEngine.Vector3
CS.UnityEngine.Vector3 = UnityEngine.Vector3

---@overload fun(x: number, y: number, z: number) : UnityEngine.Vector3
---@param x number
---@param y number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.New(x, y) end
---@param a UnityEngine.Vector3
---@param b UnityEngine.Vector3
---@param t number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Slerp(a, b, t) end
---@param a UnityEngine.Vector3
---@param b UnityEngine.Vector3
---@param t number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.SlerpUnclamped(a, b, t) end
---@overload fun(ref_normal: UnityEngine.Vector3, ref_tangent: UnityEngine.Vector3) : UnityEngine.Vector3, UnityEngine.Vector3
---@param ref_normal UnityEngine.Vector3
---@param ref_tangent UnityEngine.Vector3
---@param ref_binormal UnityEngine.Vector3
---@return UnityEngine.Vector3, UnityEngine.Vector3, UnityEngine.Vector3
function UnityEngine.Vector3.OrthoNormalize(ref_normal, ref_tangent, ref_binormal) end
---@param current UnityEngine.Vector3
---@param target UnityEngine.Vector3
---@param maxRadiansDelta number
---@param maxMagnitudeDelta number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.RotateTowards(current, target, maxRadiansDelta, maxMagnitudeDelta) end
---@param a UnityEngine.Vector3
---@param b UnityEngine.Vector3
---@param t number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Lerp(a, b, t) end
---@param a UnityEngine.Vector3
---@param b UnityEngine.Vector3
---@param t number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.LerpUnclamped(a, b, t) end
---@param current UnityEngine.Vector3
---@param target UnityEngine.Vector3
---@param maxDistanceDelta number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.MoveTowards(current, target, maxDistanceDelta) end
---@overload fun(current: UnityEngine.Vector3, target: UnityEngine.Vector3, ref_currentVelocity: UnityEngine.Vector3, smoothTime: number, maxSpeed: number) : UnityEngine.Vector3, UnityEngine.Vector3
---@overload fun(current: UnityEngine.Vector3, target: UnityEngine.Vector3, ref_currentVelocity: UnityEngine.Vector3, smoothTime: number) : UnityEngine.Vector3, UnityEngine.Vector3
---@param current UnityEngine.Vector3
---@param target UnityEngine.Vector3
---@param ref_currentVelocity UnityEngine.Vector3
---@param smoothTime number
---@param maxSpeed number
---@param deltaTime number
---@return UnityEngine.Vector3, UnityEngine.Vector3
function UnityEngine.Vector3.SmoothDamp(current, target, ref_currentVelocity, smoothTime, maxSpeed, deltaTime) end
---@overload fun(a: UnityEngine.Vector3, b: UnityEngine.Vector3) : UnityEngine.Vector3
---@param scale UnityEngine.Vector3
function UnityEngine.Vector3:Scale(scale) end
---@param lhs UnityEngine.Vector3
---@param rhs UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Cross(lhs, rhs) end
---@param inDirection UnityEngine.Vector3
---@param inNormal UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Reflect(inDirection, inNormal) end
---@overload fun(value: UnityEngine.Vector3) : UnityEngine.Vector3
function UnityEngine.Vector3:Normalize() end
---@param lhs UnityEngine.Vector3
---@param rhs UnityEngine.Vector3
---@return number
function UnityEngine.Vector3.Dot(lhs, rhs) end
---@param vector UnityEngine.Vector3
---@param onNormal UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Project(vector, onNormal) end
---@param vector UnityEngine.Vector3
---@param planeNormal UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine.Vector3.ProjectOnPlane(vector, planeNormal) end
---@param from UnityEngine.Vector3
---@param to UnityEngine.Vector3
---@return number
function UnityEngine.Vector3.Angle(from, to) end
---@param from UnityEngine.Vector3
---@param to UnityEngine.Vector3
---@param axis UnityEngine.Vector3
---@return number
function UnityEngine.Vector3.SignedAngle(from, to, axis) end
---@param a UnityEngine.Vector3
---@param b UnityEngine.Vector3
---@return number
function UnityEngine.Vector3.Distance(a, b) end
---@param vector UnityEngine.Vector3
---@param maxLength number
---@return UnityEngine.Vector3
function UnityEngine.Vector3.ClampMagnitude(vector, maxLength) end
---@param vector UnityEngine.Vector3
---@return number
function UnityEngine.Vector3.Magnitude(vector) end
---@param vector UnityEngine.Vector3
---@return number
function UnityEngine.Vector3.SqrMagnitude(vector) end
---@param lhs UnityEngine.Vector3
---@param rhs UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Min(lhs, rhs) end
---@param lhs UnityEngine.Vector3
---@param rhs UnityEngine.Vector3
---@return UnityEngine.Vector3
function UnityEngine.Vector3.Max(lhs, rhs) end
---@param newX number
---@param newY number
---@param newZ number
function UnityEngine.Vector3:Set(newX, newY, newZ) end
---@return number
function UnityEngine.Vector3:GetHashCode() end
---@overload fun(self: UnityEngine.Vector3, other: System.Object) : boolean
---@param other UnityEngine.Vector3
---@return boolean
function UnityEngine.Vector3:Equals(other) end
---@overload fun() : string
---@overload fun(self: UnityEngine.Vector3, format: string) : string
---@param format string
---@param formatProvider System.IFormatProvider
---@return string
function UnityEngine.Vector3:ToString(format, formatProvider) end

---@class UnityEngine.Vector2 : System.ValueType & System.IFormattable & System.IEquatable
---@field kEpsilon number
---@field kEpsilonNormalSqrt number
---@field x number
---@field y number
---@field zero UnityEngine.Vector2
---@field one UnityEngine.Vector2
---@field up UnityEngine.Vector2
---@field down UnityEngine.Vector2
---@field left UnityEngine.Vector2
---@field right UnityEngine.Vector2
---@field positiveInfinity UnityEngine.Vector2
---@field negativeInfinity UnityEngine.Vector2
---@field Item number
---@field normalized UnityEngine.Vector2
---@field magnitude number
---@field sqrMagnitude number
UnityEngine.Vector2 = {}
---@alias CS.UnityEngine.Vector2 UnityEngine.Vector2
CS.UnityEngine.Vector2 = UnityEngine.Vector2

---@param x number
---@param y number
---@return UnityEngine.Vector2
function UnityEngine.Vector2.New(x, y) end
---@param a UnityEngine.Vector2
---@param b UnityEngine.Vector2
---@param t number
---@return UnityEngine.Vector2
function UnityEngine.Vector2.Lerp(a, b, t) end
---@param a UnityEngine.Vector2
---@param b UnityEngine.Vector2
---@param t number
---@return UnityEngine.Vector2
function UnityEngine.Vector2.LerpUnclamped(a, b, t) end
---@param current UnityEngine.Vector2
---@param target UnityEngine.Vector2
---@param maxDistanceDelta number
---@return UnityEngine.Vector2
function UnityEngine.Vector2.MoveTowards(current, target, maxDistanceDelta) end
---@overload fun(a: UnityEngine.Vector2, b: UnityEngine.Vector2) : UnityEngine.Vector2
---@param scale UnityEngine.Vector2
function UnityEngine.Vector2:Scale(scale) end
---@param inDirection UnityEngine.Vector2
---@param inNormal UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Vector2.Reflect(inDirection, inNormal) end
---@param inDirection UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Vector2.Perpendicular(inDirection) end
---@param lhs UnityEngine.Vector2
---@param rhs UnityEngine.Vector2
---@return number
function UnityEngine.Vector2.Dot(lhs, rhs) end
---@param from UnityEngine.Vector2
---@param to UnityEngine.Vector2
---@return number
function UnityEngine.Vector2.Angle(from, to) end
---@param from UnityEngine.Vector2
---@param to UnityEngine.Vector2
---@return number
function UnityEngine.Vector2.SignedAngle(from, to) end
---@param a UnityEngine.Vector2
---@param b UnityEngine.Vector2
---@return number
function UnityEngine.Vector2.Distance(a, b) end
---@param vector UnityEngine.Vector2
---@param maxLength number
---@return UnityEngine.Vector2
function UnityEngine.Vector2.ClampMagnitude(vector, maxLength) end
---@overload fun(a: UnityEngine.Vector2) : number
---@return number
function UnityEngine.Vector2:SqrMagnitude() end
---@param lhs UnityEngine.Vector2
---@param rhs UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Vector2.Min(lhs, rhs) end
---@param lhs UnityEngine.Vector2
---@param rhs UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Vector2.Max(lhs, rhs) end
---@overload fun(current: UnityEngine.Vector2, target: UnityEngine.Vector2, ref_currentVelocity: UnityEngine.Vector2, smoothTime: number, maxSpeed: number) : UnityEngine.Vector2, UnityEngine.Vector2
---@overload fun(current: UnityEngine.Vector2, target: UnityEngine.Vector2, ref_currentVelocity: UnityEngine.Vector2, smoothTime: number) : UnityEngine.Vector2, UnityEngine.Vector2
---@param current UnityEngine.Vector2
---@param target UnityEngine.Vector2
---@param ref_currentVelocity UnityEngine.Vector2
---@param smoothTime number
---@param maxSpeed number
---@param deltaTime number
---@return UnityEngine.Vector2, UnityEngine.Vector2
function UnityEngine.Vector2.SmoothDamp(current, target, ref_currentVelocity, smoothTime, maxSpeed, deltaTime) end
---@param newX number
---@param newY number
function UnityEngine.Vector2:Set(newX, newY) end
function UnityEngine.Vector2:Normalize() end
---@overload fun() : string
---@overload fun(self: UnityEngine.Vector2, format: string) : string
---@param format string
---@param formatProvider System.IFormatProvider
---@return string
function UnityEngine.Vector2:ToString(format, formatProvider) end
---@return number
function UnityEngine.Vector2:GetHashCode() end
---@overload fun(self: UnityEngine.Vector2, other: System.Object) : boolean
---@param other UnityEngine.Vector2
---@return boolean
function UnityEngine.Vector2:Equals(other) end

---@class UnityEngine.Vector3Int : System.ValueType & System.IFormattable & System.IEquatable
---@field zero UnityEngine.Vector3Int
---@field one UnityEngine.Vector3Int
---@field up UnityEngine.Vector3Int
---@field down UnityEngine.Vector3Int
---@field left UnityEngine.Vector3Int
---@field right UnityEngine.Vector3Int
---@field forward UnityEngine.Vector3Int
---@field back UnityEngine.Vector3Int
---@field x number
---@field y number
---@field z number
---@field Item number
---@field magnitude number
---@field sqrMagnitude number
UnityEngine.Vector3Int = {}
---@alias CS.UnityEngine.Vector3Int UnityEngine.Vector3Int
CS.UnityEngine.Vector3Int = UnityEngine.Vector3Int

---@overload fun(x: number, y: number) : UnityEngine.Vector3Int
---@param x number
---@param y number
---@param z number
---@return UnityEngine.Vector3Int
function UnityEngine.Vector3Int.New(x, y, z) end
---@param a UnityEngine.Vector3Int
---@param b UnityEngine.Vector3Int
---@return number
function UnityEngine.Vector3Int.Distance(a, b) end
---@param lhs UnityEngine.Vector3Int
---@param rhs UnityEngine.Vector3Int
---@return UnityEngine.Vector3Int
function UnityEngine.Vector3Int.Min(lhs, rhs) end
---@param lhs UnityEngine.Vector3Int
---@param rhs UnityEngine.Vector3Int
---@return UnityEngine.Vector3Int
function UnityEngine.Vector3Int.Max(lhs, rhs) end
---@overload fun(a: UnityEngine.Vector3Int, b: UnityEngine.Vector3Int) : UnityEngine.Vector3Int
---@param scale UnityEngine.Vector3Int
function UnityEngine.Vector3Int:Scale(scale) end
---@param v UnityEngine.Vector3
---@return UnityEngine.Vector3Int
function UnityEngine.Vector3Int.FloorToInt(v) end
---@param v UnityEngine.Vector3
---@return UnityEngine.Vector3Int
function UnityEngine.Vector3Int.CeilToInt(v) end
---@param v UnityEngine.Vector3
---@return UnityEngine.Vector3Int
function UnityEngine.Vector3Int.RoundToInt(v) end
---@param x number
---@param y number
---@param z number
function UnityEngine.Vector3Int:Set(x, y, z) end
---@param min UnityEngine.Vector3Int
---@param max UnityEngine.Vector3Int
function UnityEngine.Vector3Int:Clamp(min, max) end
---@overload fun(self: UnityEngine.Vector3Int, other: System.Object) : boolean
---@param other UnityEngine.Vector3Int
---@return boolean
function UnityEngine.Vector3Int:Equals(other) end
---@return number
function UnityEngine.Vector3Int:GetHashCode() end
---@overload fun() : string
---@overload fun(self: UnityEngine.Vector3Int, format: string) : string
---@param format string
---@param formatProvider System.IFormatProvider
---@return string
function UnityEngine.Vector3Int:ToString(format, formatProvider) end

---@class UnityEngine.Vector2Int : System.ValueType & System.IFormattable & System.IEquatable
---@field zero UnityEngine.Vector2Int
---@field one UnityEngine.Vector2Int
---@field up UnityEngine.Vector2Int
---@field down UnityEngine.Vector2Int
---@field left UnityEngine.Vector2Int
---@field right UnityEngine.Vector2Int
---@field x number
---@field y number
---@field Item number
---@field magnitude number
---@field sqrMagnitude number
UnityEngine.Vector2Int = {}
---@alias CS.UnityEngine.Vector2Int UnityEngine.Vector2Int
CS.UnityEngine.Vector2Int = UnityEngine.Vector2Int

---@param x number
---@param y number
---@return UnityEngine.Vector2Int
function UnityEngine.Vector2Int.New(x, y) end
---@param a UnityEngine.Vector2Int
---@param b UnityEngine.Vector2Int
---@return number
function UnityEngine.Vector2Int.Distance(a, b) end
---@param lhs UnityEngine.Vector2Int
---@param rhs UnityEngine.Vector2Int
---@return UnityEngine.Vector2Int
function UnityEngine.Vector2Int.Min(lhs, rhs) end
---@param lhs UnityEngine.Vector2Int
---@param rhs UnityEngine.Vector2Int
---@return UnityEngine.Vector2Int
function UnityEngine.Vector2Int.Max(lhs, rhs) end
---@overload fun(a: UnityEngine.Vector2Int, b: UnityEngine.Vector2Int) : UnityEngine.Vector2Int
---@param scale UnityEngine.Vector2Int
function UnityEngine.Vector2Int:Scale(scale) end
---@param v UnityEngine.Vector2
---@return UnityEngine.Vector2Int
function UnityEngine.Vector2Int.FloorToInt(v) end
---@param v UnityEngine.Vector2
---@return UnityEngine.Vector2Int
function UnityEngine.Vector2Int.CeilToInt(v) end
---@param v UnityEngine.Vector2
---@return UnityEngine.Vector2Int
function UnityEngine.Vector2Int.RoundToInt(v) end
---@param x number
---@param y number
function UnityEngine.Vector2Int:Set(x, y) end
---@param min UnityEngine.Vector2Int
---@param max UnityEngine.Vector2Int
function UnityEngine.Vector2Int:Clamp(min, max) end
---@overload fun(self: UnityEngine.Vector2Int, other: System.Object) : boolean
---@param other UnityEngine.Vector2Int
---@return boolean
function UnityEngine.Vector2Int:Equals(other) end
---@return number
function UnityEngine.Vector2Int:GetHashCode() end
---@overload fun() : string
---@overload fun(self: UnityEngine.Vector2Int, format: string) : string
---@param format string
---@param formatProvider System.IFormatProvider
---@return string
function UnityEngine.Vector2Int:ToString(format, formatProvider) end

---@class UnityEngine.Quaternion : System.ValueType & System.IFormattable & System.IEquatable
---@field kEpsilon number
---@field x number
---@field y number
---@field z number
---@field w number
---@field identity UnityEngine.Quaternion
---@field Item number
---@field eulerAngles UnityEngine.Vector3
---@field normalized UnityEngine.Quaternion
UnityEngine.Quaternion = {}
---@alias CS.UnityEngine.Quaternion UnityEngine.Quaternion
CS.UnityEngine.Quaternion = UnityEngine.Quaternion

---@param x number
---@param y number
---@param z number
---@param w number
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.New(x, y, z, w) end
---@param fromDirection UnityEngine.Vector3
---@param toDirection UnityEngine.Vector3
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.FromToRotation(fromDirection, toDirection) end
---@param rotation UnityEngine.Quaternion
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.Inverse(rotation) end
---@param a UnityEngine.Quaternion
---@param b UnityEngine.Quaternion
---@param t number
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.Slerp(a, b, t) end
---@param a UnityEngine.Quaternion
---@param b UnityEngine.Quaternion
---@param t number
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.SlerpUnclamped(a, b, t) end
---@param a UnityEngine.Quaternion
---@param b UnityEngine.Quaternion
---@param t number
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.Lerp(a, b, t) end
---@param a UnityEngine.Quaternion
---@param b UnityEngine.Quaternion
---@param t number
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.LerpUnclamped(a, b, t) end
---@param angle number
---@param axis UnityEngine.Vector3
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.AngleAxis(angle, axis) end
---@overload fun(forward: UnityEngine.Vector3, upwards: UnityEngine.Vector3) : UnityEngine.Quaternion
---@param forward UnityEngine.Vector3
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.LookRotation(forward) end
---@param a UnityEngine.Quaternion
---@param b UnityEngine.Quaternion
---@return number
function UnityEngine.Quaternion.Dot(a, b) end
---@param a UnityEngine.Quaternion
---@param b UnityEngine.Quaternion
---@return number
function UnityEngine.Quaternion.Angle(a, b) end
---@overload fun(x: number, y: number, z: number) : UnityEngine.Quaternion
---@param euler UnityEngine.Vector3
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.Euler(euler) end
---@param from UnityEngine.Quaternion
---@param to UnityEngine.Quaternion
---@param maxDegreesDelta number
---@return UnityEngine.Quaternion
function UnityEngine.Quaternion.RotateTowards(from, to, maxDegreesDelta) end
---@overload fun(q: UnityEngine.Quaternion) : UnityEngine.Quaternion
function UnityEngine.Quaternion:Normalize() end
---@param newX number
---@param newY number
---@param newZ number
---@param newW number
function UnityEngine.Quaternion:Set(newX, newY, newZ, newW) end
---@overload fun(self: UnityEngine.Quaternion, view: UnityEngine.Vector3)
---@param view UnityEngine.Vector3
---@param up UnityEngine.Vector3
function UnityEngine.Quaternion:SetLookRotation(view, up) end
---@return number, UnityEngine.Vector3
function UnityEngine.Quaternion:ToAngleAxis() end
---@param fromDirection UnityEngine.Vector3
---@param toDirection UnityEngine.Vector3
function UnityEngine.Quaternion:SetFromToRotation(fromDirection, toDirection) end
---@return number
function UnityEngine.Quaternion:GetHashCode() end
---@overload fun(self: UnityEngine.Quaternion, other: System.Object) : boolean
---@param other UnityEngine.Quaternion
---@return boolean
function UnityEngine.Quaternion:Equals(other) end
---@overload fun() : string
---@overload fun(self: UnityEngine.Quaternion, format: string) : string
---@param format string
---@param formatProvider System.IFormatProvider
---@return string
function UnityEngine.Quaternion:ToString(format, formatProvider) end

---@class UnityEngine.Color : System.ValueType & System.IFormattable & System.IEquatable
---@field r number
---@field g number
---@field b number
---@field a number
---@field aliceBlue UnityEngine.Color
---@field antiqueWhite UnityEngine.Color
---@field aquamarine UnityEngine.Color
---@field azure UnityEngine.Color
---@field beige UnityEngine.Color
---@field bisque UnityEngine.Color
---@field black UnityEngine.Color
---@field blanchedAlmond UnityEngine.Color
---@field blue UnityEngine.Color
---@field blueViolet UnityEngine.Color
---@field brown UnityEngine.Color
---@field burlywood UnityEngine.Color
---@field cadetBlue UnityEngine.Color
---@field chartreuse UnityEngine.Color
---@field chocolate UnityEngine.Color
---@field clear UnityEngine.Color
---@field coral UnityEngine.Color
---@field cornflowerBlue UnityEngine.Color
---@field cornsilk UnityEngine.Color
---@field crimson UnityEngine.Color
---@field cyan UnityEngine.Color
---@field darkBlue UnityEngine.Color
---@field darkCyan UnityEngine.Color
---@field darkGoldenRod UnityEngine.Color
---@field darkGray UnityEngine.Color
---@field darkGreen UnityEngine.Color
---@field darkKhaki UnityEngine.Color
---@field darkMagenta UnityEngine.Color
---@field darkOliveGreen UnityEngine.Color
---@field darkOrange UnityEngine.Color
---@field darkOrchid UnityEngine.Color
---@field darkRed UnityEngine.Color
---@field darkSalmon UnityEngine.Color
---@field darkSeaGreen UnityEngine.Color
---@field darkSlateBlue UnityEngine.Color
---@field darkSlateGray UnityEngine.Color
---@field darkTurquoise UnityEngine.Color
---@field darkViolet UnityEngine.Color
---@field deepPink UnityEngine.Color
---@field deepSkyBlue UnityEngine.Color
---@field dimGray UnityEngine.Color
---@field dodgerBlue UnityEngine.Color
---@field firebrick UnityEngine.Color
---@field floralWhite UnityEngine.Color
---@field forestGreen UnityEngine.Color
---@field gainsboro UnityEngine.Color
---@field ghostWhite UnityEngine.Color
---@field gold UnityEngine.Color
---@field goldenRod UnityEngine.Color
---@field gray UnityEngine.Color
---@field grey UnityEngine.Color
---@field gray1 UnityEngine.Color
---@field gray2 UnityEngine.Color
---@field gray3 UnityEngine.Color
---@field gray4 UnityEngine.Color
---@field gray5 UnityEngine.Color
---@field gray6 UnityEngine.Color
---@field gray7 UnityEngine.Color
---@field gray8 UnityEngine.Color
---@field gray9 UnityEngine.Color
---@field green UnityEngine.Color
---@field greenYellow UnityEngine.Color
---@field honeydew UnityEngine.Color
---@field hotPink UnityEngine.Color
---@field indianRed UnityEngine.Color
---@field indigo UnityEngine.Color
---@field ivory UnityEngine.Color
---@field khaki UnityEngine.Color
---@field lavender UnityEngine.Color
---@field lavenderBlush UnityEngine.Color
---@field lawnGreen UnityEngine.Color
---@field lemonChiffon UnityEngine.Color
---@field lightBlue UnityEngine.Color
---@field lightCoral UnityEngine.Color
---@field lightCyan UnityEngine.Color
---@field lightGoldenRod UnityEngine.Color
---@field lightGoldenRodYellow UnityEngine.Color
---@field lightGray UnityEngine.Color
---@field lightGreen UnityEngine.Color
---@field lightPink UnityEngine.Color
---@field lightSalmon UnityEngine.Color
---@field lightSeaGreen UnityEngine.Color
---@field lightSkyBlue UnityEngine.Color
---@field lightSlateBlue UnityEngine.Color
---@field lightSlateGray UnityEngine.Color
---@field lightSteelBlue UnityEngine.Color
---@field lightYellow UnityEngine.Color
---@field limeGreen UnityEngine.Color
---@field linen UnityEngine.Color
---@field magenta UnityEngine.Color
---@field maroon UnityEngine.Color
---@field mediumAquamarine UnityEngine.Color
---@field mediumBlue UnityEngine.Color
---@field mediumOrchid UnityEngine.Color
---@field mediumPurple UnityEngine.Color
---@field mediumSeaGreen UnityEngine.Color
---@field mediumSlateBlue UnityEngine.Color
---@field mediumSpringGreen UnityEngine.Color
---@field mediumTurquoise UnityEngine.Color
---@field mediumVioletRed UnityEngine.Color
---@field midnightBlue UnityEngine.Color
---@field mintCream UnityEngine.Color
---@field mistyRose UnityEngine.Color
---@field moccasin UnityEngine.Color
---@field navajoWhite UnityEngine.Color
---@field navyBlue UnityEngine.Color
---@field oldLace UnityEngine.Color
---@field olive UnityEngine.Color
---@field oliveDrab UnityEngine.Color
---@field orange UnityEngine.Color
---@field orangeRed UnityEngine.Color
---@field orchid UnityEngine.Color
---@field paleGoldenRod UnityEngine.Color
---@field paleGreen UnityEngine.Color
---@field paleTurquoise UnityEngine.Color
---@field paleVioletRed UnityEngine.Color
---@field papayaWhip UnityEngine.Color
---@field peachPuff UnityEngine.Color
---@field peru UnityEngine.Color
---@field pink UnityEngine.Color
---@field plum UnityEngine.Color
---@field powderBlue UnityEngine.Color
---@field purple UnityEngine.Color
---@field rebeccaPurple UnityEngine.Color
---@field red UnityEngine.Color
---@field rosyBrown UnityEngine.Color
---@field royalBlue UnityEngine.Color
---@field saddleBrown UnityEngine.Color
---@field salmon UnityEngine.Color
---@field sandyBrown UnityEngine.Color
---@field seaGreen UnityEngine.Color
---@field seashell UnityEngine.Color
---@field sienna UnityEngine.Color
---@field silver UnityEngine.Color
---@field skyBlue UnityEngine.Color
---@field slateBlue UnityEngine.Color
---@field slateGray UnityEngine.Color
---@field snow UnityEngine.Color
---@field softRed UnityEngine.Color
---@field softBlue UnityEngine.Color
---@field softGreen UnityEngine.Color
---@field softYellow UnityEngine.Color
---@field springGreen UnityEngine.Color
---@field steelBlue UnityEngine.Color
---@field tan UnityEngine.Color
---@field teal UnityEngine.Color
---@field thistle UnityEngine.Color
---@field tomato UnityEngine.Color
---@field turquoise UnityEngine.Color
---@field violet UnityEngine.Color
---@field violetRed UnityEngine.Color
---@field wheat UnityEngine.Color
---@field white UnityEngine.Color
---@field whiteSmoke UnityEngine.Color
---@field yellow UnityEngine.Color
---@field yellowGreen UnityEngine.Color
---@field yellowNice UnityEngine.Color
---@field grayscale number
---@field linear UnityEngine.Color
---@field gamma UnityEngine.Color
---@field maxColorComponent number
---@field Item number
UnityEngine.Color = {}
---@alias CS.UnityEngine.Color UnityEngine.Color
CS.UnityEngine.Color = UnityEngine.Color

---@overload fun(r: number, g: number, b: number, a: number) : UnityEngine.Color
---@param r number
---@param g number
---@param b number
---@return UnityEngine.Color
function UnityEngine.Color.New(r, g, b) end
---@param a UnityEngine.Color
---@param b UnityEngine.Color
---@param t number
---@return UnityEngine.Color
function UnityEngine.Color.Lerp(a, b, t) end
---@param a UnityEngine.Color
---@param b UnityEngine.Color
---@param t number
---@return UnityEngine.Color
function UnityEngine.Color.LerpUnclamped(a, b, t) end
---@param rgbColor UnityEngine.Color
---@return number, number, number
function UnityEngine.Color.RGBToHSV(rgbColor, ) end
---@overload fun(H: number, S: number, V: number) : UnityEngine.Color
---@param H number
---@param S number
---@param V number
---@param hdr boolean
---@return UnityEngine.Color
function UnityEngine.Color.HSVToRGB(H, S, V, hdr) end
---@overload fun() : string
---@overload fun(self: UnityEngine.Color, format: string) : string
---@param format string
---@param formatProvider System.IFormatProvider
---@return string
function UnityEngine.Color:ToString(format, formatProvider) end
---@return number
function UnityEngine.Color:GetHashCode() end
---@overload fun(self: UnityEngine.Color, other: System.Object) : boolean
---@param other UnityEngine.Color
---@return boolean
function UnityEngine.Color:Equals(other) end

---@class UnityEngine.Mathf : System.ValueType
---@field PI number
---@field Infinity number
---@field NegativeInfinity number
---@field Deg2Rad number
---@field Rad2Deg number
---@field Epsilon number
UnityEngine.Mathf = {}
---@alias CS.UnityEngine.Mathf UnityEngine.Mathf
CS.UnityEngine.Mathf = UnityEngine.Mathf

---@param value number
---@return number
function UnityEngine.Mathf.GammaToLinearSpace(value) end
---@param value number
---@return number
function UnityEngine.Mathf.LinearToGammaSpace(value) end
---@param kelvin number
---@return UnityEngine.Color
function UnityEngine.Mathf.CorrelatedColorTemperatureToRGB(kelvin) end
---@param val number
---@return number
function UnityEngine.Mathf.FloatToHalf(val) end
---@param val number
---@return number
function UnityEngine.Mathf.HalfToFloat(val) end
---@param x number
---@param y number
---@return number
function UnityEngine.Mathf.PerlinNoise(x, y) end
---@param x number
---@return number
function UnityEngine.Mathf.PerlinNoise1D(x) end
---@param f number
---@return number
function UnityEngine.Mathf.Sin(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Cos(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Tan(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Asin(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Acos(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Atan(f) end
---@param y number
---@param x number
---@return number
function UnityEngine.Mathf.Atan2(y, x) end
---@param f number
---@return number
function UnityEngine.Mathf.Sqrt(f) end
---@overload fun(f: number) : number
---@param value number
---@return number
function UnityEngine.Mathf.Abs(value) end
---@overload fun(a: number, b: number) : number
---@overload fun(values: System.Single[]) : number
---@overload fun(a: number, b: number) : number
---@param values System.Int32[]
---@return number
function UnityEngine.Mathf.Min(values) end
---@overload fun(a: number, b: number) : number
---@overload fun(values: System.Single[]) : number
---@overload fun(a: number, b: number) : number
---@param values System.Int32[]
---@return number
function UnityEngine.Mathf.Max(values) end
---@param f number
---@param p number
---@return number
function UnityEngine.Mathf.Pow(f, p) end
---@param power number
---@return number
function UnityEngine.Mathf.Exp(power) end
---@overload fun(f: number, p: number) : number
---@param f number
---@return number
function UnityEngine.Mathf.Log(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Log10(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Ceil(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Floor(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Round(f) end
---@param f number
---@return number
function UnityEngine.Mathf.CeilToInt(f) end
---@param f number
---@return number
function UnityEngine.Mathf.FloorToInt(f) end
---@param f number
---@return number
function UnityEngine.Mathf.RoundToInt(f) end
---@param f number
---@return number
function UnityEngine.Mathf.Sign(f) end
---@overload fun(value: number, min: number, max: number) : number
---@param value number
---@param min number
---@param max number
---@return number
function UnityEngine.Mathf.Clamp(value, min, max) end
---@param value number
---@return number
function UnityEngine.Mathf.Clamp01(value) end
---@param a number
---@param b number
---@param t number
---@return number
function UnityEngine.Mathf.Lerp(a, b, t) end
---@param a number
---@param b number
---@param t number
---@return number
function UnityEngine.Mathf.LerpUnclamped(a, b, t) end
---@param a number
---@param b number
---@param t number
---@return number
function UnityEngine.Mathf.LerpAngle(a, b, t) end
---@param current number
---@param target number
---@param maxDelta number
---@return number
function UnityEngine.Mathf.MoveTowards(current, target, maxDelta) end
---@param current number
---@param target number
---@param maxDelta number
---@return number
function UnityEngine.Mathf.MoveTowardsAngle(current, target, maxDelta) end
---@param from number
---@param to number
---@param t number
---@return number
function UnityEngine.Mathf.SmoothStep(from, to, t) end
---@param value number
---@param absmax number
---@param gamma number
---@return number
function UnityEngine.Mathf.Gamma(value, absmax, gamma) end
---@param a number
---@param b number
---@return boolean
function UnityEngine.Mathf.Approximately(a, b) end
---@overload fun(current: number, target: number, ref_currentVelocity: number, smoothTime: number, maxSpeed: number) : number, number
---@overload fun(current: number, target: number, ref_currentVelocity: number, smoothTime: number) : number, number
---@param current number
---@param target number
---@param ref_currentVelocity number
---@param smoothTime number
---@param maxSpeed number
---@param deltaTime number
---@return number, number
function UnityEngine.Mathf.SmoothDamp(current, target, ref_currentVelocity, smoothTime, maxSpeed, deltaTime) end
---@overload fun(current: number, target: number, ref_currentVelocity: number, smoothTime: number, maxSpeed: number) : number, number
---@overload fun(current: number, target: number, ref_currentVelocity: number, smoothTime: number) : number, number
---@param current number
---@param target number
---@param ref_currentVelocity number
---@param smoothTime number
---@param maxSpeed number
---@param deltaTime number
---@return number, number
function UnityEngine.Mathf.SmoothDampAngle(current, target, ref_currentVelocity, smoothTime, maxSpeed, deltaTime) end
---@param t number
---@param length number
---@return number
function UnityEngine.Mathf.Repeat(t, length) end
---@param t number
---@param length number
---@return number
function UnityEngine.Mathf.PingPong(t, length) end
---@param a number
---@param b number
---@param value number
---@return number
function UnityEngine.Mathf.InverseLerp(a, b, value) end
---@param current number
---@param target number
---@return number
function UnityEngine.Mathf.DeltaAngle(current, target) end
---@param value number
---@return number
function UnityEngine.Mathf.NextPowerOfTwo(value) end
---@param value number
---@return number
function UnityEngine.Mathf.ClosestPowerOfTwo(value) end
---@param value number
---@return boolean
function UnityEngine.Mathf.IsPowerOfTwo(value) end

---@class UnityEngine.Time : System.Object
---@field time number
---@field timeAsDouble number
---@field timeAsRational Unity.IntegerTime.RationalTime
---@field timeSinceLevelLoad number
---@field timeSinceLevelLoadAsDouble number
---@field deltaTime number
---@field fixedTime number
---@field fixedTimeAsDouble number
---@field unscaledTime number
---@field unscaledTimeAsDouble number
---@field fixedUnscaledTime number
---@field fixedUnscaledTimeAsDouble number
---@field unscaledDeltaTime number
---@field fixedUnscaledDeltaTime number
---@field fixedDeltaTime number
---@field maximumDeltaTime number
---@field smoothDeltaTime number
---@field maximumParticleDeltaTime number
---@field timeScale number
---@field frameCount number
---@field renderedFrameCount number
---@field realtimeSinceStartup number
---@field realtimeSinceStartupAsDouble number
---@field captureDeltaTime number
---@field captureDeltaTimeRational Unity.IntegerTime.RationalTime
---@field captureFramerate number
---@field inFixedTimeStep boolean
UnityEngine.Time = {}
---@alias CS.UnityEngine.Time UnityEngine.Time
CS.UnityEngine.Time = UnityEngine.Time

---@return UnityEngine.Time
function UnityEngine.Time.New() end

---@class UnityEngine.Rigidbody2D : UnityEngine.Component
---@field position UnityEngine.Vector2
---@field rotation number
---@field linearVelocity UnityEngine.Vector2
---@field linearVelocityX number
---@field linearVelocityY number
---@field angularVelocity number
---@field useAutoMass boolean
---@field mass number
---@field sharedMaterial UnityEngine.PhysicsMaterial2D
---@field centerOfMass UnityEngine.Vector2
---@field worldCenterOfMass UnityEngine.Vector2
---@field inertia number
---@field linearDamping number
---@field angularDamping number
---@field gravityScale number
---@field bodyType UnityEngine.RigidbodyType2D
---@field useFullKinematicContacts boolean
---@field freezeRotation boolean
---@field constraints UnityEngine.RigidbodyConstraints2D
---@field simulated boolean
---@field interpolation UnityEngine.RigidbodyInterpolation2D
---@field sleepMode UnityEngine.RigidbodySleepMode2D
---@field collisionDetectionMode UnityEngine.CollisionDetectionMode2D
---@field attachedColliderCount number
---@field totalForce UnityEngine.Vector2
---@field totalTorque number
---@field excludeLayers UnityEngine.LayerMask
---@field includeLayers UnityEngine.LayerMask
---@field localToWorldMatrix UnityEngine.Matrix4x4
UnityEngine.Rigidbody2D = {}
---@alias CS.UnityEngine.Rigidbody2D UnityEngine.Rigidbody2D
CS.UnityEngine.Rigidbody2D = UnityEngine.Rigidbody2D

---@return UnityEngine.Rigidbody2D
function UnityEngine.Rigidbody2D.New() end
---@overload fun(self: UnityEngine.Rigidbody2D, angle: number)
---@param rotation UnityEngine.Quaternion
function UnityEngine.Rigidbody2D:SetRotation(rotation) end
---@param position UnityEngine.Vector2
function UnityEngine.Rigidbody2D:MovePosition(position) end
---@overload fun(self: UnityEngine.Rigidbody2D, angle: number)
---@param rotation UnityEngine.Quaternion
function UnityEngine.Rigidbody2D:MoveRotation(rotation) end
---@overload fun(self: UnityEngine.Rigidbody2D, position: UnityEngine.Vector2, angle: number)
---@param position UnityEngine.Vector2
---@param rotation UnityEngine.Quaternion
function UnityEngine.Rigidbody2D:MovePositionAndRotation(position, rotation) end
---@param velocity UnityEngine.Vector2
---@param deltaTime number
---@param slideMovement UnityEngine.Rigidbody2D.SlideMovement
---@return UnityEngine.Rigidbody2D.SlideResults
function UnityEngine.Rigidbody2D:Slide(velocity, deltaTime, slideMovement) end
---@return boolean
function UnityEngine.Rigidbody2D:IsSleeping() end
---@return boolean
function UnityEngine.Rigidbody2D:IsAwake() end
function UnityEngine.Rigidbody2D:Sleep() end
function UnityEngine.Rigidbody2D:WakeUp() end
---@overload fun(self: UnityEngine.Rigidbody2D, collider: UnityEngine.Collider2D) : boolean
---@overload fun(self: UnityEngine.Rigidbody2D, collider: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D) : boolean
---@param contactFilter UnityEngine.ContactFilter2D
---@return boolean
function UnityEngine.Rigidbody2D:IsTouching(contactFilter) end
---@overload fun() : boolean
---@param layerMask number
---@return boolean
function UnityEngine.Rigidbody2D:IsTouchingLayers(layerMask) end
---@param point UnityEngine.Vector2
---@return boolean
function UnityEngine.Rigidbody2D:OverlapPoint(point) end
---@overload fun(self: UnityEngine.Rigidbody2D, collider: UnityEngine.Collider2D) : UnityEngine.ColliderDistance2D
---@param thisPosition UnityEngine.Vector2
---@param thisAngle number
---@param collider UnityEngine.Collider2D
---@param position UnityEngine.Vector2
---@param angle number
---@return UnityEngine.ColliderDistance2D
function UnityEngine.Rigidbody2D:Distance(thisPosition, thisAngle, collider, position, angle) end
---@param position UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:ClosestPoint(position) end
---@overload fun(self: UnityEngine.Rigidbody2D, force: UnityEngine.Vector2)
---@param force UnityEngine.Vector2
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddForce(force, mode) end
---@param force number
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddForceX(force, mode) end
---@param force number
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddForceY(force, mode) end
---@overload fun(self: UnityEngine.Rigidbody2D, relativeForce: UnityEngine.Vector2)
---@param relativeForce UnityEngine.Vector2
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddRelativeForce(relativeForce, mode) end
---@param force number
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddRelativeForceX(force, mode) end
---@param force number
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddRelativeForceY(force, mode) end
---@overload fun(self: UnityEngine.Rigidbody2D, force: UnityEngine.Vector2, position: UnityEngine.Vector2)
---@param force UnityEngine.Vector2
---@param position UnityEngine.Vector2
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddForceAtPosition(force, position, mode) end
---@overload fun(self: UnityEngine.Rigidbody2D, torque: number)
---@param torque number
---@param mode UnityEngine.ForceMode2D
function UnityEngine.Rigidbody2D:AddTorque(torque, mode) end
---@param point UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:GetPoint(point) end
---@param relativePoint UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:GetRelativePoint(relativePoint) end
---@param vector UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:GetVector(vector) end
---@param relativeVector UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:GetRelativeVector(relativeVector) end
---@param point UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:GetPointVelocity(point) end
---@param relativePoint UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Rigidbody2D:GetRelativePointVelocity(relativePoint) end
---@overload fun(self: UnityEngine.Rigidbody2D, contacts: UnityEngine.ContactPoint2D[]) : number
---@overload fun(self: UnityEngine.Rigidbody2D, contacts: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Rigidbody2D, contactFilter: UnityEngine.ContactFilter2D, contacts: UnityEngine.ContactPoint2D[]) : number
---@overload fun(self: UnityEngine.Rigidbody2D, contactFilter: UnityEngine.ContactFilter2D, contacts: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Rigidbody2D, colliders: UnityEngine.Collider2D[]) : number
---@overload fun(self: UnityEngine.Rigidbody2D, colliders: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Rigidbody2D, contactFilter: UnityEngine.ContactFilter2D, colliders: UnityEngine.Collider2D[]) : number
---@param contactFilter UnityEngine.ContactFilter2D
---@param colliders System.Collections.Generic.List
---@return number
function UnityEngine.Rigidbody2D:GetContacts(contactFilter, colliders) end
---@overload fun() : number, UnityEngine.Collider2D
---@overload fun(self: UnityEngine.Rigidbody2D, results: System.Collections.Generic.List) : number
---@overload fun(findTriggers: boolean) : number, UnityEngine.Collider2D
---@param results System.Collections.Generic.List
---@param findTriggers boolean
---@return number
function UnityEngine.Rigidbody2D:GetAttachedColliders(results, findTriggers) end
---@param physicsShapeGroup UnityEngine.PhysicsShapeGroup2D
---@return number
function UnityEngine.Rigidbody2D:GetShapes(physicsShapeGroup) end
---@overload fun(self: UnityEngine.Rigidbody2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[]) : number
---@overload fun(self: UnityEngine.Rigidbody2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number) : number
---@overload fun(self: UnityEngine.Rigidbody2D, direction: UnityEngine.Vector2, results: System.Collections.Generic.List, distance: number) : number
---@overload fun(self: UnityEngine.Rigidbody2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[]) : number
---@overload fun(self: UnityEngine.Rigidbody2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[], distance: number) : number
---@overload fun(self: UnityEngine.Rigidbody2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: System.Collections.Generic.List, distance: number) : number
---@overload fun(self: UnityEngine.Rigidbody2D, position: UnityEngine.Vector2, angle: number, direction: UnityEngine.Vector2, results: System.Collections.Generic.List, distance: number) : number
---@param position UnityEngine.Vector2
---@param angle number
---@param direction UnityEngine.Vector2
---@param contactFilter UnityEngine.ContactFilter2D
---@param results System.Collections.Generic.List
---@param distance number
---@return number
function UnityEngine.Rigidbody2D:Cast(position, angle, direction, contactFilter, results, distance) end
---@overload fun(self: UnityEngine.Rigidbody2D, contactFilter: UnityEngine.ContactFilter2D, ) : number, UnityEngine.Collider2D
---@overload fun(self: UnityEngine.Rigidbody2D, results: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Rigidbody2D, contactFilter: UnityEngine.ContactFilter2D, results: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Rigidbody2D, position: UnityEngine.Vector2, angle: number, results: System.Collections.Generic.List) : number
---@param position UnityEngine.Vector2
---@param angle number
---@param contactFilter UnityEngine.ContactFilter2D
---@param results System.Collections.Generic.List
---@return number
function UnityEngine.Rigidbody2D:Overlap(position, angle, contactFilter, results) end

---@class UnityEngine.Collider2D : UnityEngine.Behaviour
---@field density number
---@field isTrigger boolean
---@field usedByEffector boolean
---@field compositeOperation UnityEngine.Collider2D.CompositeOperation
---@field compositeOrder number
---@field composite UnityEngine.CompositeCollider2D
---@field offset UnityEngine.Vector2
---@field attachedRigidbody UnityEngine.Rigidbody2D
---@field localToWorldMatrix UnityEngine.Matrix4x4
---@field shapeCount number
---@field bounds UnityEngine.Bounds
---@field errorState UnityEngine.ColliderErrorState2D
---@field compositeCapable boolean
---@field sharedMaterial UnityEngine.PhysicsMaterial2D
---@field layerOverridePriority number
---@field excludeLayers UnityEngine.LayerMask
---@field includeLayers UnityEngine.LayerMask
---@field forceSendLayers UnityEngine.LayerMask
---@field forceReceiveLayers UnityEngine.LayerMask
---@field contactCaptureLayers UnityEngine.LayerMask
---@field callbackLayers UnityEngine.LayerMask
---@field friction number
---@field bounciness number
---@field frictionCombine UnityEngine.PhysicsMaterialCombine2D
---@field bounceCombine UnityEngine.PhysicsMaterialCombine2D
UnityEngine.Collider2D = {}
---@alias CS.UnityEngine.Collider2D UnityEngine.Collider2D
CS.UnityEngine.Collider2D = UnityEngine.Collider2D

---@return UnityEngine.Collider2D
function UnityEngine.Collider2D.New() end
---@overload fun(self: UnityEngine.Collider2D, useBodyPosition: boolean, useBodyRotation: boolean) : UnityEngine.Mesh
---@param useBodyPosition boolean
---@param useBodyRotation boolean
---@param useDelaunay boolean
---@return UnityEngine.Mesh
function UnityEngine.Collider2D:CreateMesh(useBodyPosition, useBodyRotation, useDelaunay) end
---@return number
function UnityEngine.Collider2D:GetShapeHash() end
---@overload fun(self: UnityEngine.Collider2D, physicsShapeGroup: UnityEngine.PhysicsShapeGroup2D) : number
---@param physicsShapeGroup UnityEngine.PhysicsShapeGroup2D
---@param shapeIndex number
---@param shapeCount number
---@return number
function UnityEngine.Collider2D:GetShapes(physicsShapeGroup, shapeIndex, shapeCount) end
---@param bounds System.Collections.Generic.List
---@param useRadii boolean
---@param useWorldSpace boolean
---@return UnityEngine.Bounds
function UnityEngine.Collider2D:GetShapeBounds(bounds, useRadii, useWorldSpace) end
---@overload fun(self: UnityEngine.Collider2D, collider: UnityEngine.Collider2D) : boolean
---@overload fun(self: UnityEngine.Collider2D, collider: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D) : boolean
---@param contactFilter UnityEngine.ContactFilter2D
---@return boolean
function UnityEngine.Collider2D:IsTouching(contactFilter) end
---@overload fun() : boolean
---@param layerMask number
---@return boolean
function UnityEngine.Collider2D:IsTouchingLayers(layerMask) end
---@param point UnityEngine.Vector2
---@return boolean
function UnityEngine.Collider2D:OverlapPoint(point) end
---@overload fun(self: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.Collider2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, results: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D, results: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Collider2D, position: UnityEngine.Vector2, angle: number, results: System.Collections.Generic.List) : number
---@param position UnityEngine.Vector2
---@param angle number
---@param contactFilter UnityEngine.ContactFilter2D
---@param results System.Collections.Generic.List
---@return number
function UnityEngine.Collider2D:Overlap(position, angle, contactFilter, results) end
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number, ignoreSiblingColliders: boolean) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[], distance: number) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[], distance: number, ignoreSiblingColliders: boolean) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: System.Collections.Generic.List, distance: number, ignoreSiblingColliders: boolean) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: System.Collections.Generic.List, distance: number, ignoreSiblingColliders: boolean) : number
---@overload fun(self: UnityEngine.Collider2D, position: UnityEngine.Vector2, angle: number, direction: UnityEngine.Vector2, results: System.Collections.Generic.List, distance: number, ignoreSiblingColliders: boolean) : number
---@param position UnityEngine.Vector2
---@param angle number
---@param direction UnityEngine.Vector2
---@param contactFilter UnityEngine.ContactFilter2D
---@param results System.Collections.Generic.List
---@param distance number
---@param ignoreSiblingColliders boolean
---@return number
function UnityEngine.Collider2D:Cast(position, angle, direction, contactFilter, results, distance, ignoreSiblingColliders) end
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number, layerMask: number) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number, layerMask: number, minDepth: number) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, results: UnityEngine.RaycastHit2D[], distance: number, layerMask: number, minDepth: number, maxDepth: number) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, direction: UnityEngine.Vector2, contactFilter: UnityEngine.ContactFilter2D, results: UnityEngine.RaycastHit2D[], distance: number) : number
---@param direction UnityEngine.Vector2
---@param contactFilter UnityEngine.ContactFilter2D
---@param results System.Collections.Generic.List
---@param distance number
---@return number
function UnityEngine.Collider2D:Raycast(direction, contactFilter, results, distance) end
---@overload fun(self: UnityEngine.Collider2D, collider: UnityEngine.Collider2D) : UnityEngine.ColliderDistance2D
---@param thisPosition UnityEngine.Vector2
---@param thisAngle number
---@param collider UnityEngine.Collider2D
---@param position UnityEngine.Vector2
---@param angle number
---@return UnityEngine.ColliderDistance2D
function UnityEngine.Collider2D:Distance(thisPosition, thisAngle, collider, position, angle) end
---@param position UnityEngine.Vector2
---@return UnityEngine.Vector2
function UnityEngine.Collider2D:ClosestPoint(position) end
---@overload fun(self: UnityEngine.Collider2D, contacts: UnityEngine.ContactPoint2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, contacts: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D, contacts: UnityEngine.ContactPoint2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D, contacts: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Collider2D, colliders: UnityEngine.Collider2D[]) : number
---@overload fun(self: UnityEngine.Collider2D, colliders: System.Collections.Generic.List) : number
---@overload fun(self: UnityEngine.Collider2D, contactFilter: UnityEngine.ContactFilter2D, colliders: UnityEngine.Collider2D[]) : number
---@param contactFilter UnityEngine.ContactFilter2D
---@param colliders System.Collections.Generic.List
---@return number
function UnityEngine.Collider2D:GetContacts(contactFilter, colliders) end

---@class UnityEngine.Debug : System.Object
---@field unityLogger UnityEngine.ILogger
---@field developerConsoleEnabled boolean
---@field developerConsoleVisible boolean
---@field isDebugBuild boolean
UnityEngine.Debug = {}
---@alias CS.UnityEngine.Debug UnityEngine.Debug
CS.UnityEngine.Debug = UnityEngine.Debug

---@return UnityEngine.Debug
function UnityEngine.Debug.New() end
---@overload fun(start: UnityEngine.Vector3, _end: UnityEngine.Vector3, color: UnityEngine.Color, duration: number)
---@overload fun(start: UnityEngine.Vector3, _end: UnityEngine.Vector3, color: UnityEngine.Color)
---@overload fun(start: UnityEngine.Vector3, _end: UnityEngine.Vector3)
---@param start UnityEngine.Vector3
---@param _end UnityEngine.Vector3
---@param color UnityEngine.Color
---@param duration number
---@param depthTest boolean
function UnityEngine.Debug.DrawLine(start, _end, color, duration, depthTest) end
---@overload fun(start: UnityEngine.Vector3, dir: UnityEngine.Vector3, color: UnityEngine.Color, duration: number)
---@overload fun(start: UnityEngine.Vector3, dir: UnityEngine.Vector3, color: UnityEngine.Color)
---@overload fun(start: UnityEngine.Vector3, dir: UnityEngine.Vector3)
---@param start UnityEngine.Vector3
---@param dir UnityEngine.Vector3
---@param color UnityEngine.Color
---@param duration number
---@param depthTest boolean
function UnityEngine.Debug.DrawRay(start, dir, color, duration, depthTest) end
function UnityEngine.Debug.Break() end
function UnityEngine.Debug.DebugBreak() end
---@param buffer System.Byte*
---@param bufferMax number
---@param projectFolder string
---@return number
function UnityEngine.Debug.ExtractStackTraceNoAlloc(buffer, bufferMax, projectFolder) end
---@overload fun(message: System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine.Debug.Log(message, context) end
---@overload fun(format: string, args: System.Object[])
---@overload fun(context: UnityEngine.Object, format: string, args: System.Object[])
---@param logType UnityEngine.LogType
---@param logOptions UnityEngine.LogOption
---@param context UnityEngine.Object
---@param format string
---@param args System.Object[]
function UnityEngine.Debug.LogFormat(logType, logOptions, context, format, args) end
---@overload fun(message: System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine.Debug.LogError(message, context) end
---@overload fun(format: string, args: System.Object[])
---@param context UnityEngine.Object
---@param format string
---@param args System.Object[]
function UnityEngine.Debug.LogErrorFormat(context, format, args) end
function UnityEngine.Debug.ClearDeveloperConsole() end
---@overload fun(exception: System.Exception)
---@param exception System.Exception
---@param context UnityEngine.Object
function UnityEngine.Debug.LogException(exception, context) end
---@overload fun(message: System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine.Debug.LogWarning(message, context) end
---@overload fun(format: string, args: System.Object[])
---@param context UnityEngine.Object
---@param format string
---@param args System.Object[]
function UnityEngine.Debug.LogWarningFormat(context, format, args) end
---@overload fun(condition: boolean)
---@overload fun(condition: boolean, context: UnityEngine.Object)
---@overload fun(condition: boolean, message: System.Object)
---@overload fun(condition: boolean, message: string)
---@overload fun(condition: boolean, message: System.Object, context: UnityEngine.Object)
---@param condition boolean
---@param message string
---@param context UnityEngine.Object
function UnityEngine.Debug.Assert(condition, message, context) end
---@overload fun(condition: boolean, format: string, args: System.Object[])
---@param condition boolean
---@param context UnityEngine.Object
---@param format string
---@param args System.Object[]
function UnityEngine.Debug.AssertFormat(condition, context, format, args) end
---@overload fun(message: System.Object)
---@param message System.Object
---@param context UnityEngine.Object
function UnityEngine.Debug.LogAssertion(message, context) end
---@overload fun(format: string, args: System.Object[])
---@param context UnityEngine.Object
---@param format string
---@param args System.Object[]
function UnityEngine.Debug.LogAssertionFormat(context, format, args) end
---@return UnityEngine.Debug.StartupLog[]
function UnityEngine.Debug.RetrieveStartupLogs() end
---@param level UnityEngine.IntegrityCheckLevel
---@return string
function UnityEngine.Debug.CheckIntegrity(level) end
---@param level UnityEngine.ValidationLevel
---@return boolean
function UnityEngine.Debug.IsValidationLevelEnabled(level) end

---@class Empty.Science : System.Object
Empty.Science = {}
---@alias CS.Empty.Science Empty.Science
CS.Empty.Science = Empty.Science

---@return Empty.Science
function Empty.Science.New() end
function Empty.Science:Research() end

---@class Empty.Test.Football : System.Object
Empty.Test.Football = {}
---@alias CS.Empty.Test.Football Empty.Test.Football
CS.Empty.Test.Football = Empty.Test.Football

---@return Empty.Test.Football
function Empty.Test.Football.New() end
function Empty.Test.Football:DoSomething() end


