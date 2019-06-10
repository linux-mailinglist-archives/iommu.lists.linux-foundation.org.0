Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219B3BC0C
	for <lists.iommu@lfdr.de>; Mon, 10 Jun 2019 20:52:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AB6FCDC2;
	Mon, 10 Jun 2019 18:51:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 096B0DC2
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 18:51:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7DBB46D6
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 18:51:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C646C15;
	Mon, 10 Jun 2019 11:51:52 -0700 (PDT)
Received: from ostrya.cambridge.arm.com (ostrya.cambridge.arm.com
	[10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A12A93F246; 
	Mon, 10 Jun 2019 11:51:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: will.deacon@arm.com
Subject: [PATCH 2/8] dt-bindings: document PASID property for IOMMU masters
Date: Mon, 10 Jun 2019 19:47:08 +0100
Message-Id: <20190610184714.6786-3-jean-philippe.brucker@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Arm systems, some platform devices behind an SMMU may support the PASID
feature, which offers multiple address space. Let the firmware tell us
when a device supports PASID.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
Previous discussion on this patch last year:
https://patchwork.ozlabs.org/patch/872275/
I split PASID and stall definitions, keeping only PASID here.
---
 Documentation/devicetree/bindings/iommu/iommu.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/iommu.txt b/Documentation/devicetree/bindings/iommu/iommu.txt
index 5a8b4624defc..3c36334e4f94 100644
--- a/Documentation/devicetree/bindings/iommu/iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/iommu.txt
@@ -86,6 +86,12 @@ have a means to turn off translation. But it is invalid in such cases to
 disable the IOMMU's device tree node in the first place because it would
 prevent any driver from properly setting up the translations.
 
+Optional properties:
+--------------------
+- pasid-num-bits: Some masters support multiple address spaces for DMA, by
+  tagging DMA transactions with an address space identifier. By default,
+  this is 0, which means that the device only has one address space.
+
 
 Notes:
 ======
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
