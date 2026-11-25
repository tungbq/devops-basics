## Crossplane practice

1. **Reconcile drift**: after running the [basics demo](../basics/), edit the ConfigMap directly (`kubectl edit configmap hello-from-crossplane`, change `greeting`). Wait for the next reconcile and observe whether Crossplane restores the value declared in the `Object`. Then change `greeting` in the `Object` itself and confirm the ConfigMap follows.

2. **Delete propagation**: run `kubectl delete object hello-config` and confirm the ConfigMap is gone. Now re-create the `Object` with `spec.deletionPolicy: Orphan` and repeat — what happens to the ConfigMap this time?

3. **Break it, then read the status**: change `providerConfigRef.name` to a name that doesn't exist and run `kubectl describe object hello-config`. Find the `Synced`/`Ready` conditions and the error message, then fix it and confirm it recovers.

4. **Your first Composition**: install `function-patch-and-transform`, define an XRD such as `XGreeting` with a `message` field, and write a Composition that creates an `Object` ConfigMap using that value. Create an `XGreeting` and verify the ConfigMap appears (see https://docs.crossplane.io/latest/composition/compositions/).

- Crossplane docs: https://docs.crossplane.io/
