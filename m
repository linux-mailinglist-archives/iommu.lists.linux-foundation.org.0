Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C17F539DAF
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 09:07:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 885CD40535;
	Wed,  1 Jun 2022 07:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8n5_Vxn2CG6f; Wed,  1 Jun 2022 07:07:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8CA6B40470;
	Wed,  1 Jun 2022 07:07:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DA58C002D;
	Wed,  1 Jun 2022 07:07:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B631C002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4732040408
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FpBdUk0tIuI for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 07:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70D3240127
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:12 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 u7-20020a170902e5c700b001621a781270so659167plf.15
 for <iommu@lists.linux-foundation.org>; Wed, 01 Jun 2022 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Mk17D+aOzb7UCdNS2oz9IAwDr5MmRg+quCipw6fx4RQ=;
 b=hQa0JnnmV2cX05wxogayF7DAeIwm91UA5DD4Pd0261qK2nG5mlRfb8p0PwXRgLwmcG
 6gimTBEfRJnzqCBPwGFDLXwY23Jge7qCK5EKBtDVk+4ZHueBZe2ScEh2abiJOXvqClXF
 aItT2KKmdUihJqxg6KlMJQ+n9hDQfaXwUgpDUXId5vW641rUWKofWrnrujEe72Sytvnk
 iXsC3g9D+PkO64XwFNhsJCy/xgMMwq44IzwR510vfqTBnn54+HA0yDiVcTK99umRrrcq
 KawtwQ3E7vKCwmO2izMB9zQh9evWd8zx74HbqExwInwGL34iXnuFQ1QqmbkBW7qSDv5A
 GPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Mk17D+aOzb7UCdNS2oz9IAwDr5MmRg+quCipw6fx4RQ=;
 b=fNHTGb1deXXYaqIj1YDS/AiecurNst4ourCP29lmmHaLHxfbwHnI1Gg+V7Ikrw1yQq
 H0jld9m4zTd+se87Oa1epyjz0HD2NdXR8iUZZwqpcSzRMdwCrPwTsYSqOrWRbXBh06m2
 Qmic6WjQeIpjH3+9sx5fLiSGmi4cO6C0IFWF/KUejZ3qq1JKkHhp0l00Zyg7GBn493Nk
 KsptbHA0n23ovy33IO9X/K6GK0XBfvyZ+D0u2k0tlnDNc+RcgQD0bxanc4P+XcWcrd5e
 yr2aNTEIskDNj3UfdcpJufn/J8VqeFuJjYuQHPgZf+lg6eA1RyBwOEfPsvpkdvIOvZHQ
 NsGQ==
X-Gm-Message-State: AOAM531g1L+pRZazPgTfDONybU1KBYCc+fy4WIyldxIkbuINBLYgpxYG
 Nz7SMXWMBP4oCNy7zR7z5vPBiaRwMIAzkOM=
X-Google-Smtp-Source: ABdhPJwo0w/Ul81l80Uz+X1lE0Knuok5VeKXEtMoQ0Yzewr/LH6PL8JE3PUvMoXQAWKjDKNKYDX9hXZkKLb6+II=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a17:902:da8e:b0:164:537:d910 with SMTP
 id j14-20020a170902da8e00b001640537d910mr7067516plx.75.1654067231712; Wed, 01
 Jun 2022 00:07:11 -0700 (PDT)
Date: Wed,  1 Jun 2022 00:06:56 -0700
Message-Id: <20220601070707.3946847-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 0/9] deferred_probe_timeout logic clean up
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

This series is based on linux-next + these 2 small patches applies on top:
https://lore.kernel.org/lkml/20220526034609.480766-1-saravanak@google.com/

A lot of the deferred_probe_timeout logic is redundant with
fw_devlink=on.  Also, enabling deferred_probe_timeout by default breaks
a few cases.

This series tries to delete the redundant logic, simplify the frameworks
that use driver_deferred_probe_check_state(), enable
deferred_probe_timeout=10 by default, and fixes the nfsroot failure
case.

The overall idea of this series is to replace the global behavior of
driver_deferred_probe_check_state() where all devices give up waiting on
supplier at the same time with a more granular behavior:

1. Devices with all their suppliers successfully probed by late_initcall
   probe as usual and avoid unnecessary deferred probe attempts.

2. At or after late_initcall, in cases where boot would break because of
   fw_devlink=on being strict about the ordering, we

   a. Temporarily relax the enforcement to probe any unprobed devices
      that can probe successfully in the current state of the system.
      For example, when we boot with a NFS rootfs and no network device
      has probed.
   b. Go back to enforcing the ordering for any devices that haven't
      probed.

3. After deferred probe timeout expires, we permanently give up waiting
   on supplier devices without drivers. At this point, whatever devices
   can probe without some of their optional suppliers end up probing.

In the case where module support is disabled, it's fairly
straightforward and all device probes are completed before the initcalls
are done.

Patches 1 to 3 are fairly straightforward and can probably be applied
right away.

Patches 4 to 6 are for fixing the NFS rootfs issue and setting the
default deferred_probe_timeout back to 10 seconds when modules are
enabled.

Patches 7 to 9 are further clean up of the deferred_probe_timeout logic
so that no framework has to know/care about deferred_probe_timeout.

Yoshihiro/Geert,

If you can test this patch series and confirm that the NFS root case
works, I'd really appreciate that.

Thanks,
Saravana

v1 -> v2:
Rewrote the NFS rootfs fix to be a lot less destructive on the
fw_devlink ordering for devices that don't end up probing during the
"best effort" attempt at probing all devices needed for a network rootfs

Saravana Kannan (9):
  PM: domains: Delete usage of driver_deferred_probe_check_state()
  pinctrl: devicetree: Delete usage of
    driver_deferred_probe_check_state()
  net: mdio: Delete usage of driver_deferred_probe_check_state()
  driver core: Add wait_for_init_devices_probe helper function
  net: ipconfig: Relax fw_devlink if we need to mount a network rootfs
  Revert "driver core: Set default deferred_probe_timeout back to 0."
  driver core: Set fw_devlink.strict=1 by default
  iommu/of: Delete usage of driver_deferred_probe_check_state()
  driver core: Delete driver_deferred_probe_check_state()

 drivers/base/base.h            |   1 +
 drivers/base/core.c            | 102 ++++++++++++++++++++++++++++++---
 drivers/base/dd.c              |  54 ++++++-----------
 drivers/base/power/domain.c    |   2 +-
 drivers/iommu/of_iommu.c       |   2 +-
 drivers/net/mdio/fwnode_mdio.c |   4 +-
 drivers/pinctrl/devicetree.c   |   2 +-
 include/linux/device/driver.h  |   2 +-
 net/ipv4/ipconfig.c            |   6 ++
 9 files changed, 126 insertions(+), 49 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
