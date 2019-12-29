Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B436812C74D
	for <lists.iommu@lfdr.de>; Sun, 29 Dec 2019 18:56:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5815681EAA;
	Sun, 29 Dec 2019 17:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAwmYMaoDUIN; Sun, 29 Dec 2019 17:56:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A5BC781F3F;
	Sun, 29 Dec 2019 17:56:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC7CC077D;
	Sun, 29 Dec 2019 17:56:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDAD5C077D
 for <iommu@lists.linux-foundation.org>; Sun, 29 Dec 2019 17:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ACB6981F3F
 for <iommu@lists.linux-foundation.org>; Sun, 29 Dec 2019 17:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjtCRmw6q1rU for <iommu@lists.linux-foundation.org>;
 Sun, 29 Dec 2019 17:56:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2B03281EAA
 for <iommu@lists.linux-foundation.org>; Sun, 29 Dec 2019 17:56:27 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 822F3222D9;
 Sun, 29 Dec 2019 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577642187;
 bh=MDlhEhj2G1pFcoetkRyZjXVVe1s/XlYTo1QrtkXMKTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bvI9kuHb5yigdwFHUAjFyJ4WILLXn6uHMdPcpseR+66VpTWnJY8c7fzFMZucq++4k
 KGHF1qQJc8iXvf9DcSdE0303xFoHSAvnEu9sM3KCmjJ5AN+/VgLEUQrwTNrmhaY6g6
 2yicBlQHXpXFIXK2lVT0THAoZzgX98ZBbEgAYWaQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 371/434] iommu/vt-d: Allocate reserved region for ISA with
 correct permission
Date: Sun, 29 Dec 2019 18:27:04 +0100
Message-Id: <20191229172726.637712160@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229172702.393141737@linuxfoundation.org>
References: <20191229172702.393141737@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Joerg Roedel <jroedel@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

From: Jerry Snitselaar <jsnitsel@redhat.com>

commit cde9319e884eb6267a0df446f3c131fe1108defb upstream.

Currently the reserved region for ISA is allocated with no
permissions. If a dma domain is being used, mapping this region will
fail. Set the permissions to DMA_PTE_READ|DMA_PTE_WRITE.

Cc: Joerg Roedel <jroedel@suse.de>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: stable@vger.kernel.org # v5.3+
Fixes: d850c2ee5fe2 ("iommu/vt-d: Expose ISA direct mapping region via iommu_get_resv_regions")
Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/iommu/intel-iommu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5697,7 +5697,7 @@ static void intel_iommu_get_resv_regions
 		struct pci_dev *pdev = to_pci_dev(device);
 
 		if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA) {
-			reg = iommu_alloc_resv_region(0, 1UL << 24, 0,
+			reg = iommu_alloc_resv_region(0, 1UL << 24, prot,
 						   IOMMU_RESV_DIRECT_RELAXABLE);
 			if (reg)
 				list_add_tail(&reg->list, head);


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
