Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF33110174
	for <lists.iommu@lfdr.de>; Tue,  3 Dec 2019 16:43:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B920C22728;
	Tue,  3 Dec 2019 15:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaLlmNdcnveA; Tue,  3 Dec 2019 15:43:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D82EF226B3;
	Tue,  3 Dec 2019 15:43:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C03F7C087F;
	Tue,  3 Dec 2019 15:43:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD65C087F
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 15:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8BA0C87DC5
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 15:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHeZKz69KWYp for <iommu@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 15:43:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 03B6F87B59
 for <iommu@lists.linux-foundation.org>; Tue,  3 Dec 2019 15:43:27 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 2so2022305pfg.12
 for <iommu@lists.linux-foundation.org>; Tue, 03 Dec 2019 07:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=b4QI//StRs4CfOqNK9eqzKkxRA2qL4/GWMuaqRRnuEU=;
 b=icMa4rx1ZMtE5mnOvVjmI5EmCAMki8keD1M3g2P0oLuo3vA1I4BJW9vCZHa3KzebQg
 gX8+tYGFryfM9B+JfdjFEuj/FnbP8ZaCdaIDSiP3gkT1m0rpfhYO5EtPm7NjSH7S92Q7
 Ckqx4GyGRmfWn/wQqCRffS+ElnSoMBGBGth1jD5cGB+NLc6HwogzaEQ5JaZaQ+09fyJ5
 APB4eEpHr2arpYyM55WyB3NqajX3n1/4dS3wDV6IYKjWg0IFVruXrBB9sudTsjGZzqPC
 sKm0dZxtL526oFKECCvin+Dw51/efc/ZJh7TmRSFhL7ClWy/kOzTqCN7bOU+hrHOP387
 9vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=b4QI//StRs4CfOqNK9eqzKkxRA2qL4/GWMuaqRRnuEU=;
 b=F9Gf12cfPfnGhu2kxJMBYZvf17vFuUFllCIUaTTkdAsRa+TFGj8qR0UVVbA+8+1Dxq
 o0CtzYDXDbbvNd921DD7VABbdvJM4U2N6lzcWQAQv70EIN6zWVhTIwj56bOSdGvJZ2KC
 Z9YDSa8b+0k3HaWZxhJCqKibJrRNWTMez4UWW8frLLkxRtD+vWmPJDUUgaqWLnwdSIN7
 ijoPeR/fDJo/uwUgHTut7ggG6RDqD12+k8Fj2UlflJmwqAWkz1HbgO6J9uJtSunxklgH
 n4p77+O4HoZ9m9kHh0HRTrADBV5tbP6RWgBDqQl8m4+0BEUrvANJvLZwcU375jwvd7WK
 LoUw==
X-Gm-Message-State: APjAAAXMrTEeWQfnkL1n8MbwR3Q/FYDJ1FRcmrXSuK+eIxyS/9uIQskd
 b3ySPs0o9Vx9QpywylSJRZkY4A==
X-Google-Smtp-Source: APXvYqy5sg3uYP2PMY30/llWMY51RYB4brhQFWOKQRquMLOrHznUnkMZQ43OVqK+IyKd3Jqdc+RmFw==
X-Received: by 2002:a63:1624:: with SMTP id w36mr5602893pgl.404.1575387806408; 
 Tue, 03 Dec 2019 07:43:26 -0800 (PST)
Received: from [10.83.42.232] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id e11sm3953969pgh.54.2019.12.03.07.43.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Dec 2019 07:43:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: [PATCH v6 1/3] PCI: Fix off by one in dma_alias_mask allocation size
Message-Id: <910070E3-7964-4549-B77F-EC7FC6144503@arista.com>
Date: Tue, 3 Dec 2019 15:43:22 +0000
To: linux-pci@vger.kernel.org
X-Mailer: Apple Mail (2.3445.102.3)
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Dmitry Safonov <dima@arista.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
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
From: James Sewart via iommu <iommu@lists.linux-foundation.org>
Reply-To: James Sewart <jamessewart@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The number of possible devfns is 256, add def and correct uses.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Signed-off-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/pci.c    | 2 +-
 drivers/pci/search.c | 2 +-
 include/linux/pci.h  | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index a97e2571a527..d3c83248f3ce 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5876,7 +5876,7 @@ int pci_set_vga_state(struct pci_dev *dev, bool decode,
 void pci_add_dma_alias(struct pci_dev *dev, u8 devfn)
 {
 	if (!dev->dma_alias_mask)
-		dev->dma_alias_mask = bitmap_zalloc(U8_MAX, GFP_KERNEL);
+		dev->dma_alias_mask = bitmap_zalloc(MAX_NR_DEVFNS, GFP_KERNEL);
 	if (!dev->dma_alias_mask) {
 		pci_warn(dev, "Unable to allocate DMA alias mask\n");
 		return;
diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index bade14002fd8..9e4dfae47252 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -43,7 +43,7 @@ int pci_for_each_dma_alias(struct pci_dev *pdev,
 	if (unlikely(pdev->dma_alias_mask)) {
 		u8 devfn;
 
-		for_each_set_bit(devfn, pdev->dma_alias_mask, U8_MAX) {
+		for_each_set_bit(devfn, pdev->dma_alias_mask, MAX_NR_DEVFNS) {
 			ret = fn(pdev, PCI_DEVID(pdev->bus->number, devfn),
 				 data);
 			if (ret)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1a6cf19eac2d..6481da29d667 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -57,6 +57,8 @@
 #define PCI_DEVID(bus, devfn)	((((u16)(bus)) << 8) | (devfn))
 /* return bus from PCI devid = ((u16)bus_number) << 8) | devfn */
 #define PCI_BUS_NUM(x) (((x) >> 8) & 0xff)
+/* Number of possible devfns. devfns can be from 0.0 to 1f.7 inclusive */
+#define MAX_NR_DEVFNS 256
 
 /* pci_slot represents a physical slot */
 struct pci_slot {
-- 
2.24.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
