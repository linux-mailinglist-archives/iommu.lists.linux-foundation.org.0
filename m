Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5379C539DB6
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 09:07:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E1B540127;
	Wed,  1 Jun 2022 07:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYWptGRZMhyH; Wed,  1 Jun 2022 07:07:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5AC6740567;
	Wed,  1 Jun 2022 07:07:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2525CC002D;
	Wed,  1 Jun 2022 07:07:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 632E9C002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50D0A60E86
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EiVdWW9iRwTW for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 07:07:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C82060E07
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:24 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-30c2f3431b4so8081207b3.21
 for <iommu@lists.linux-foundation.org>; Wed, 01 Jun 2022 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0HXVJdCIsomGxp3WPSn+2YS1x/Q9SjPFbGK9Hb8FY3Q=;
 b=Jsx/IdjeTXR9MiQtdujJ0FlEiN2DLL3p1z/+sKrPzQ5PVUHP/npXBXYzqCNA1KWL0X
 z3oIUD2EKzfWwjtb9Rp9R7DWWWZTVuLSbHgj2j1SyWjMt0zOaH9Yzntys+ofnzk2dj/W
 f3u0Pu0UOiGibZ6P3V82NUN/7H7F60cOtPgOtUY6yJzIQULjU3s0zTX4zyZV36B4xh4X
 UlsMI7AImfk8W+elLBcnH2I63UaRpt0wpc2o1GxrV9VXFItxShjqOzLDTBF02tjKFhw5
 3cRWGoHuDz/LQWJPe0249jYTzWv1t308fA03c3f/rQb7eCTa7XL/8r8ZXPI4kigmDRGo
 96bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0HXVJdCIsomGxp3WPSn+2YS1x/Q9SjPFbGK9Hb8FY3Q=;
 b=Uo/XOsd8DMiqw60Hg7bV7X+/ycbJqBtSV9IUzZmMtY2b1SbYg5PEmVwou123+y9qep
 zQ1QiKBVjC+SDhtvdt4i6l4Vz4yG+wxsdf+jGb6JcHrbLfz8LXP3/ot/5j2TUMogM0MQ
 SwvtMyuq6H0Y7n/dm7JyW028VF5CA3/M/ZNdNGSeYJ5nHLO5Js/rukktfmsF3zpk1iX7
 O/kCO46hU3dA3Qk9LWw8tH8DxmcXvZQfo/QJCN8VDqtc8D3mLMM0KhUdkvMI5+j0Y+3Q
 j3rvSVng20p+ZqcOSJX4HyosIiXGFGR3lB8AzxNBVG5eblgFJHMjI0GmB82GLPofmjFz
 JGhg==
X-Gm-Message-State: AOAM533qI6fwoTaxzisirI/wAMpsyGsyK1sSnda2rmNCn4PYGQ25hX5R
 Im2NQ43/F0pH495maX3s+BZa6XztAVp+Uik=
X-Google-Smtp-Source: ABdhPJwJjzxLgIuLlsumiwwcLunjHDDJmCACEgK5Oc+WJCGQpf48+C4ImTSOeUa5BoryRp796dUO+ICognLJoOA=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a0d:db81:0:b0:30c:2ba5:9e1d with SMTP id
 d123-20020a0ddb81000000b0030c2ba59e1dmr19834254ywe.519.1654067243146; Wed, 01
 Jun 2022 00:07:23 -0700 (PDT)
Date: Wed,  1 Jun 2022 00:07:00 -0700
In-Reply-To: <20220601070707.3946847-1-saravanak@google.com>
Message-Id: <20220601070707.3946847-5-saravanak@google.com>
Mime-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 4/9] driver core: Add wait_for_init_devices_probe helper
 function
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 David Ahern <dsahern@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
From: Saravana Kannan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Some devices might need to be probed and bound successfully before the
kernel boot sequence can finish and move on to init/userspace. For
example, a network interface might need to be bound to be able to mount
a NFS rootfs.

With fw_devlink=on by default, some of these devices might be blocked
from probing because they are waiting on a optional supplier that
doesn't have a driver. While fw_devlink will eventually identify such
devices and unblock the probing automatically, it might be too late by
the time it unblocks the probing of devices. For example, the IP4
autoconfig might timeout before fw_devlink unblocks probing of the
network interface.

This function is available to temporarily try and probe all devices that
have a driver even if some of their suppliers haven't been added or
don't have drivers.

The drivers can then decide which of the suppliers are optional vs
mandatory and probe the device if possible. By the time this function
returns, all such "best effort" probes are guaranteed to be completed.
If a device successfully probes in this mode, we delete all fw_devlink
discovered dependencies of that device where the supplier hasn't yet
probed successfully because they have to be optional dependencies.

This also means that some devices that aren't needed for init and could
have waited for their optional supplier to probe (when the supplier's
module is loaded later on) would end up probing prematurely with limited
functionality.  So call this function only when boot would fail without
it.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/base.h           |   1 +
 drivers/base/core.c           | 100 ++++++++++++++++++++++++++++++++--
 drivers/base/dd.c             |  19 +++++--
 include/linux/device/driver.h |   1 +
 4 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index ab71403d102f..b3a43a164dcd 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -160,6 +160,7 @@ extern int devres_release_all(struct device *dev);
 extern void device_block_probing(void);
 extern void device_unblock_probing(void);
 extern void deferred_probe_extend_timeout(void);
+extern void driver_deferred_probe_trigger(void);
 
 /* /sys/devices directory */
 extern struct kset *devices_kset;
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 7cd789c4985d..61fdfe99b348 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -54,6 +54,7 @@ static unsigned int defer_sync_state_count = 1;
 static DEFINE_MUTEX(fwnode_link_lock);
 static bool fw_devlink_is_permissive(void);
 static bool fw_devlink_drv_reg_done;
+static bool fw_devlink_best_effort;
 
 /**
  * fwnode_link_add - Create a link between two fwnode_handles.
@@ -965,6 +966,11 @@ static void device_links_missing_supplier(struct device *dev)
 	}
 }
 
+static bool dev_is_best_effort(struct device *dev)
+{
+	return fw_devlink_best_effort && dev->can_match;
+}
+
 /**
  * device_links_check_suppliers - Check presence of supplier drivers.
  * @dev: Consumer device.
@@ -984,7 +990,7 @@ static void device_links_missing_supplier(struct device *dev)
 int device_links_check_suppliers(struct device *dev)
 {
 	struct device_link *link;
-	int ret = 0;
+	int ret = 0, fwnode_ret = 0;
 	struct fwnode_handle *sup_fw;
 
 	/*
@@ -997,12 +1003,17 @@ int device_links_check_suppliers(struct device *dev)
 		sup_fw = list_first_entry(&dev->fwnode->suppliers,
 					  struct fwnode_link,
 					  c_hook)->supplier;
-		dev_err_probe(dev, -EPROBE_DEFER, "wait for supplier %pfwP\n",
-			      sup_fw);
-		mutex_unlock(&fwnode_link_lock);
-		return -EPROBE_DEFER;
+		if (!dev_is_best_effort(dev)) {
+			fwnode_ret = -EPROBE_DEFER;
+			dev_err_probe(dev, -EPROBE_DEFER,
+				    "wait for supplier %pfwP\n", sup_fw);
+		} else {
+			fwnode_ret = -EAGAIN;
+		}
 	}
 	mutex_unlock(&fwnode_link_lock);
+	if (fwnode_ret == -EPROBE_DEFER)
+		return fwnode_ret;
 
 	device_links_write_lock();
 
@@ -1012,6 +1023,14 @@ int device_links_check_suppliers(struct device *dev)
 
 		if (link->status != DL_STATE_AVAILABLE &&
 		    !(link->flags & DL_FLAG_SYNC_STATE_ONLY)) {
+
+			if (dev_is_best_effort(dev) &&
+			    link->flags & DL_FLAG_INFERRED &&
+			    !link->supplier->can_match) {
+				ret = -EAGAIN;
+				continue;
+			}
+
 			device_links_missing_supplier(dev);
 			dev_err_probe(dev, -EPROBE_DEFER,
 				      "supplier %s not ready\n",
@@ -1024,7 +1043,8 @@ int device_links_check_suppliers(struct device *dev)
 	dev->links.status = DL_DEV_PROBING;
 
 	device_links_write_unlock();
-	return ret;
+
+	return ret ? ret : fwnode_ret;
 }
 
 /**
@@ -1289,6 +1309,18 @@ void device_links_driver_bound(struct device *dev)
 			 * save to drop the managed link completely.
 			 */
 			device_link_drop_managed(link);
+		} else if (dev_is_best_effort(dev) &&
+			   link->flags & DL_FLAG_INFERRED &&
+			   link->status != DL_STATE_CONSUMER_PROBE &&
+			   !link->supplier->can_match) {
+			/*
+			 * When dev_is_best_effort() is true, we ignore device
+			 * links to suppliers that don't have a driver.  If the
+			 * consumer device still managed to probe, there's no
+			 * point in maintaining a device link in a weird state
+			 * (consumer probed before supplier). So delete it.
+			 */
+			device_link_drop_managed(link);
 		} else {
 			WARN_ON(link->status != DL_STATE_CONSUMER_PROBE);
 			WRITE_ONCE(link->status, DL_STATE_ACTIVE);
@@ -1655,6 +1687,62 @@ void fw_devlink_drivers_done(void)
 	device_links_write_unlock();
 }
 
+/**
+ * wait_for_init_devices_probe - Try to probe any device needed for init
+ *
+ * Some devices might need to be probed and bound successfully before the kernel
+ * boot sequence can finish and move on to init/userspace. For example, a
+ * network interface might need to be bound to be able to mount a NFS rootfs.
+ *
+ * With fw_devlink=on by default, some of these devices might be blocked from
+ * probing because they are waiting on a optional supplier that doesn't have a
+ * driver. While fw_devlink will eventually identify such devices and unblock
+ * the probing automatically, it might be too late by the time it unblocks the
+ * probing of devices. For example, the IP4 autoconfig might timeout before
+ * fw_devlink unblocks probing of the network interface.
+ *
+ * This function is available to temporarily try and probe all devices that have
+ * a driver even if some of their suppliers haven't been added or don't have
+ * drivers.
+ *
+ * The drivers can then decide which of the suppliers are optional vs mandatory
+ * and probe the device if possible. By the time this function returns, all such
+ * "best effort" probes are guaranteed to be completed. If a device successfully
+ * probes in this mode, we delete all fw_devlink discovered dependencies of that
+ * device where the supplier hasn't yet probed successfully because they have to
+ * be optional dependencies.
+ *
+ * Any devices that didn't successfully probe go back to being treated as if
+ * this function was never called.
+ *
+ * This also means that some devices that aren't needed for init and could have
+ * waited for their optional supplier to probe (when the supplier's module is
+ * loaded later on) would end up probing prematurely with limited functionality.
+ * So call this function only when boot would fail without it.
+ */
+void __init wait_for_init_devices_probe(void)
+{
+	if (!fw_devlink_flags || fw_devlink_is_permissive())
+		return;
+
+	/*
+	 * Wait for all ongoing probes to finish so that the "best effort" is
+	 * only applied to devices that can't probe otherwise.
+	 */
+	wait_for_device_probe();
+
+	pr_info("Trying to probe devices needed for running init ...\n");
+	fw_devlink_best_effort = true;
+	driver_deferred_probe_trigger();
+
+	/*
+	 * Wait for all "best effort" probes to finish before going back to
+	 * normal enforcement.
+	 */
+	wait_for_device_probe();
+	fw_devlink_best_effort = false;
+}
+
 static void fw_devlink_unblock_consumers(struct device *dev)
 {
 	struct device_link *link;
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 11b0fb6414d3..4a55fbb7e0da 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -172,7 +172,7 @@ static bool driver_deferred_probe_enable;
  * changes in the midst of a probe, then deferred processing should be triggered
  * again.
  */
-static void driver_deferred_probe_trigger(void)
+void driver_deferred_probe_trigger(void)
 {
 	if (!driver_deferred_probe_enable)
 		return;
@@ -580,7 +580,7 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 {
 	bool test_remove = IS_ENABLED(CONFIG_DEBUG_TEST_DRIVER_REMOVE) &&
 			   !drv->suppress_bind_attrs;
-	int ret;
+	int ret, link_ret;
 
 	if (defer_all_probes) {
 		/*
@@ -592,9 +592,9 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 		return -EPROBE_DEFER;
 	}
 
-	ret = device_links_check_suppliers(dev);
-	if (ret)
-		return ret;
+	link_ret = device_links_check_suppliers(dev);
+	if (link_ret == -EPROBE_DEFER)
+		return link_ret;
 
 	pr_debug("bus: '%s': %s: probing driver %s with device %s\n",
 		 drv->bus->name, __func__, drv->name, dev_name(dev));
@@ -633,6 +633,15 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 
 	ret = call_driver_probe(dev, drv);
 	if (ret) {
+		/*
+		 * If fw_devlink_best_effort is active (denoted by -EAGAIN), the
+		 * device might actually probe properly once some of its missing
+		 * suppliers have probed. So, treat this as if the driver
+		 * returned -EPROBE_DEFER.
+		 */
+		if (link_ret == -EAGAIN)
+			ret = -EPROBE_DEFER;
+
 		/*
 		 * Return probe errors as positive values so that the callers
 		 * can distinguish them from other errors.
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 700453017e1c..2114d65b862f 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -129,6 +129,7 @@ extern struct device_driver *driver_find(const char *name,
 					 struct bus_type *bus);
 extern int driver_probe_done(void);
 extern void wait_for_device_probe(void);
+void __init wait_for_init_devices_probe(void);
 
 /* sysfs interface for exporting driver attributes */
 
-- 
2.36.1.255.ge46751e96f-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
