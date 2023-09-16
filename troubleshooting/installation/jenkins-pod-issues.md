# Cannot run Jenkins
- Issue Multiple plugin prerequisites not met
```
2023-09-16 15:52:36 io.jenkins.tools.pluginmanager.impl.AggregatePluginPrerequisitesNotMetException: Multiple plugin prerequisites not met:
2023-09-16 15:52:36 Plugin workflow-aggregator:596.v8c21c963d92d (via pipeline-model-definition:2.2144.v077a_d1928a_40->git-client:4.5.0) depends on configuration-as-code:1670.v564dc8b_982d0, but there is an older version defined on the top level - configuration-as-code:1647.ve39ca_b_829b_42,
2023-09-16 15:52:36 Plugin git:5.1.0 (via git-client:4.5.0) depends on configuration-as-code:1670.v564dc8b_982d0, but there is an older version defined on the top level - configuration-as-code:1647.ve39ca_b_829b_42
2023-09-16 15:52:36     at io.jenkins.tools.pluginmanager.impl.PluginManager.start(PluginManager.java:240)
2023-09-16 15:52:36     at io.jenkins.tools.pluginmanager.impl.PluginManager.start(PluginManager.java:189)
2023-09-16 15:52:36     at io.jenkins.tools.pluginmanager.cli.Main.main(Main.java:52)
2023-09-16 15:52:36     Suppressed: io.jenkins.tools.pluginmanager.impl.PluginDependencyException: Plugin workflow-aggregator:596.v8c21c963d92d (via pipeline-model-definition:2.2144.v077a_d1928a_40->git-client:4.5.0) depends on configuration-as-code:1670.v564dc8b_982d0, but there is an older version defined on the top level - configuration-as-code:1647.ve39ca_b_829b_42
2023-09-16 15:52:36             at io.jenkins.tools.pluginmanager.impl.PluginManager.resolveRecursiveDependencies(PluginManager.java:1128)
2023-09-16 15:52:36             at io.jenkins.tools.pluginmanager.impl.PluginManager.findPluginsAndDependencies(PluginManager.java:698)
2023-09-16 15:52:36             at io.jenkins.tools.pluginmanager.impl.PluginManager.start(PluginManager.java:232)
2023-09-16 15:52:36             ... 2 more
2023-09-16 15:52:36     Suppressed: io.jenkins.tools.pluginmanager.impl.PluginDependencyException: Plugin git:5.1.0 (via git-client:4.5.0) depends on configuration-as-code:1670.v564dc8b_982d0, but there is an older version defined on the top level - configuration-as-code:1647.ve39ca_b_829b_42
2023-09-16 15:52:36             at io.jenkins.tools.pluginmanager.impl.PluginManager.resolveRecursiveDependencies(PluginManager.java:1128)
2023-09-16 15:52:36             at io.jenkins.tools.pluginmanager.impl.PluginManager.findPluginsAndDependencies(PluginManager.java:698)
2023-09-16 15:52:36             at io.jenkins.tools.pluginmanager.impl.PluginManager.start(PluginManager.java:232)
2023-09-16 15:52:36             ... 2 more
2023-09-16 15:52:36 Multiple plugin prerequisites not met:
2023-09-16 15:52:36 Plugin workflow-aggregator:596.v8c21c963d92d (via pipeline-model-definition:2.2144.v077a_d1928a_40->git-client:4.5.0) depends on configuration-as-code:1670.v564dc8b_982d0, but there is an older version defined on the top level - configuration-as-code:1647.ve39ca_b_829b_42,
2023-09-16 15:52:36 Plugin git:5.1.0 (via git-client:4.5.0) depends on configuration-as-code:1670.v564dc8b_982d0, but there is an older version defined on the top level - configuration-as-code:1647.ve39ca_b_829b_42
```