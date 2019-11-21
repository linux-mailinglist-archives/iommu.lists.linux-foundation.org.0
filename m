Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C291051B1
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 12:49:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7AB8887B0;
	Thu, 21 Nov 2019 11:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63Mkicjh9rQC; Thu, 21 Nov 2019 11:49:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C954887CA;
	Thu, 21 Nov 2019 11:49:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 548B9C18DA;
	Thu, 21 Nov 2019 11:49:42 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27B29C18DA
 for <iommu@lists.linuxfoundation.org>; Thu, 21 Nov 2019 11:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 17A3187E94
 for <iommu@lists.linuxfoundation.org>; Thu, 21 Nov 2019 11:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcURT9qYPEIp for <iommu@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 11:49:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8C82B87EB1
 for <iommu@lists.linuxfoundation.org>; Thu, 21 Nov 2019 11:49:40 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F4C120898;
 Thu, 21 Nov 2019 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574336980;
 bh=QFUkeMh2cozH/3aW8Dt6eBLsD3SxxmEo/ZkMadr5dlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k+E3SA9k3JVY4mHqNt1OdB2QBv50OD/1h46PyL/Ci2wLWVR7TQ25noB3MFDFqC4y6
 iqN4OIHAJ4SvQPylMV1jpM3XYittDSPi0SNTHDicQsnwLTEE7byjsLeks197MhMOef
 57/e4dKo39fKVS5pYv7rO1QuJBt0VoyoK4uKyicw=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/14] drivers/iommu: Allow IOMMU bus ops to be unregistered
Date: Thu, 21 Nov 2019 11:49:10 +0000
Message-Id: <20191121114918.2293-7-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121114918.2293-1-will@kernel.org>
References: <20191121114918.2293-1-will@kernel.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Will Deacon <will@kernel.org>
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

'bus_set_iommu()' allows IOMMU drivers to register their ops for a given
bus type. Unfortunately, it then doesn't allow them to be removed, which
is necessary for modular drivers to shutdown cleanly so that they can be
reloaded later on.

Allow 'bus_set_iommu()' to take a NULL 'ops' argument, which clear the
ops pointer for the selected bus_type.

Signed-off-by: Will Deacon <will@kernel.org>
---
 drivers/iommu/iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4bfecfbbe2cf..e99704c2e06b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1558,6 +1558,11 @@ int bus_set_iommu(struct bus_type *bus, const struct iommu_ops *ops)
 {
 	int err;
 
+	if (ops == NULL) {
+		bus->iommu_ops = NULL;
+		return 0;
+	}
+
 	if (bus->iommu_ops != NULL)
 		return -EBUSY;
 
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
