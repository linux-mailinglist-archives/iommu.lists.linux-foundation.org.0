Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AC91043D3
	for <lists.iommu@lfdr.de>; Wed, 20 Nov 2019 20:00:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E3A5B8786B;
	Wed, 20 Nov 2019 19:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unv9146Cw5IP; Wed, 20 Nov 2019 19:00:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE7BF87865;
	Wed, 20 Nov 2019 19:00:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FDB9C18DA;
	Wed, 20 Nov 2019 19:00:44 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42064C18DA
 for <iommu@lists.linuxfoundation.org>; Wed, 20 Nov 2019 19:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 260102A12D
 for <iommu@lists.linuxfoundation.org>; Wed, 20 Nov 2019 19:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLtAidAxyp0u for <iommu@lists.linuxfoundation.org>;
 Wed, 20 Nov 2019 19:00:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D955E2A13C
 for <iommu@lists.linuxfoundation.org>; Wed, 20 Nov 2019 19:00:41 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A87C2068D;
 Wed, 20 Nov 2019 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574276441;
 bh=mrDAvCusJ7RjzcAQOztGK0ooNaLrN91ho3jdV+DQ7h0=;
 h=From:To:Cc:Subject:Date:From;
 b=UeCqc0Wph0UiKuGQ1wqj0IpYkFA9zpDP2ilB3qagqYRCib5rZ+yPnKuhSgqm4NUSL
 dyePP7n0zyhUjHgbD6xQgaw1m1FyTX/zR6LG9pLUd666YIXn3Ojuyc5SzT2A0OP3Os
 m0AAUe6Da+1bNZ3s2LQpE3/53/s3gIfbgg5bZIsA=
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] of: property: Add device link support for "iommu-map"
Date: Wed, 20 Nov 2019 19:00:28 +0000
Message-Id: <20191120190028.4722-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: iommu@lists.linuxfoundation.org, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Commit 8e12257dead7 ("of: property: Add device link support for iommus,
mboxes and io-channels") added device link support for IOMMU linkages
described using the "iommus" property. For PCI devices, this property
is not present and instead the "iommu-map" property is used on the host
bridge node to map the endpoint RequesterIDs to their corresponding
IOMMU instance.

Add support for "iommu-map" to the device link supplier bindings so that
probing of PCI devices can be deferred until after the IOMMU is
available.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---

Applies against driver-core/driver-core-next.
Tested on AMD Seattle (arm64).

 drivers/of/property.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 0fa04692e3cc..37e0d408430d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1190,10 +1190,20 @@ DEFINE_SIMPLE_PROP(mboxes, "mboxes", "#mbox-cells")
 DEFINE_SIMPLE_PROP(io_channels, "io-channel", "#io-channel-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 
+static struct device_node *parse_iommu_maps(struct device_node *np,
+					    const char *prop_name, int index)
+{
+	if (strcmp(prop_name, "iommu-map"))
+		return NULL;
+
+	return of_parse_phandle(np, prop_name, (index * 4) + 1);
+}
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
 	{ .parse_prop = parse_iommus, },
+	{ .parse_prop = parse_iommu_maps, },
 	{ .parse_prop = parse_mboxes, },
 	{ .parse_prop = parse_io_channels, },
 	{ .parse_prop = parse_regulators, },
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
