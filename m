Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B74AB10D5DB
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 13:49:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3EFD588561;
	Fri, 29 Nov 2019 12:49:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mS75NGA-+qo; Fri, 29 Nov 2019 12:49:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BCA0188572;
	Fri, 29 Nov 2019 12:49:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB55AC0881;
	Fri, 29 Nov 2019 12:49:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17F15C0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 12:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1419586B96
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 12:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEl3iK5ry-c8 for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 12:49:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A0058869DD
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 12:49:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s14so8168416wmh.4
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 04:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9ZkhQrbE0pqWo4Xrfbt5no2EyvavM8680V6oMcMbppE=;
 b=OFr2xRM6+3SE+J561j8El5HiW8f7yc8oGUzpj/7E8POne7eTulFBtYHtJn5fz4hyvz
 zDUXVHTDDC5F7dsjGLRwsDmoW0oUZVv4AY2omdXXWIZSS+YF0GIjHSObhdQi6CIkzbth
 SxWAjc3L/6KTQSXP77E3ONhr9VEu+17vM5Ufu9aWoGQ/02qc1OrOAbkgZylu8WgA5ssX
 dS7BuDadYqG1zlSol3JsmFepDRZV93pwGhrP8thfqJPXcUF3L6/SDi7b2Yf5i9fCBsjv
 H4XTWEc1Ac6vYIy/bZaTfDt7+romyqPW4NOxZIpDn+T1My0NZVHRHRq+bCFgP6D5UvOI
 UfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9ZkhQrbE0pqWo4Xrfbt5no2EyvavM8680V6oMcMbppE=;
 b=c3r6l7EHTHUO4HUR3ez868KKx0KY6wmCI4jzIlLwINPkZ4uxcvr9RIhZ+9HZ64gqGw
 nyuE5r/4lYM2+nPJ1A023uZMLRNPl7TOT2N8zB5hB64JnQu80xzudVGU2r/2/GYtBkIG
 bdNqFxWIP/E/a/O24NYJCuw8p57tZjP+va+XAKvfVRhnO8D9wxtlVTNljkIS3AC9+OxR
 dWxqfdf7lXw2byutEEfTKrexuZRprQBN6rn80VC5XZKGo6B9AwCz9XV9WUeoV8+tVYK6
 UaviE4b2Z2eqKBBE+9JdRQ+sr9bE0IzySr8JfaJOQc7uQA8z0lAOHsHYYlAxPa5hbx7j
 TTvA==
X-Gm-Message-State: APjAAAUJVSgHDjcRoBMhzVfjuDiQOODLJYo0fHaBy7RyjMfq8+eiTKYH
 TDgWbig7AxnfvD/mh+O0533Epg==
X-Google-Smtp-Source: APXvYqzrFnew0Xg726sQyLozIpTyofkdje1WOGBoORFXdlnSGE+sAJRA2NS18bWiUsqdxxmHWnZTzw==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr15129630wmb.40.1575031781981; 
 Fri, 29 Nov 2019 04:49:41 -0800 (PST)
Received: from [10.83.36.220] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id l10sm29695601wrg.90.2019.11.29.04.49.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Nov 2019 04:49:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: [PATCH v4 2/2] PCI: Add DMA alias quirk for PLX PEX NTB
In-Reply-To: <435064D4-00F0-47F5-94D2-2C354F6B1206@arista.com>
Date: Fri, 29 Nov 2019 12:49:40 +0000
Message-Id: <AAD9A3CA-59E4-4982-B902-7032CA96FAD1@arista.com>
References: <20191120193228.GA103670@google.com>
 <6A902F0D-FE98-4760-ADBB-4D5987D866BE@arista.com>
 <20191126173833.GA16069@infradead.org>
 <547214A9-9FD0-4DD5-80E1-1F5A467A0913@arista.com>
 <9c54c5dd-702c-a19b-38ba-55ab73b24729@deltatee.com>
 <435064D4-00F0-47F5-94D2-2C354F6B1206@arista.com>
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

The PLX PEX NTB forwards DMA transactions using Requester ID's that
don't exist as PCI devices. The devfn for a transaction is used as an
index into a lookup table storing the origin of a transaction on the
other side of the bridge.

This patch aliases all possible devfn's to the NTB device so that any
transaction coming in is governed by the mappings for the NTB.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Signed-off-by: James Sewart <jamessewart@arista.com>
---
 drivers/pci/quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 0f3f5afc73fd..3a67049ca630 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5315,6 +5315,21 @@ SWITCHTEC_QUIRK(0x8574);  /* PFXI 64XG3 */
 SWITCHTEC_QUIRK(0x8575);  /* PFXI 80XG3 */
 SWITCHTEC_QUIRK(0x8576);  /* PFXI 96XG3 */
 
+/*
+ * PLX NTB uses devfn proxy IDs to move TLPs between NT endpoints. These IDs
+ * are used to forward responses to the originator on the other side of the
+ * NTB. Alias all possible IDs to the NTB to permit access when the IOMMU is
+ * turned on.
+ */
+static void quirk_plx_ntb_dma_alias(struct pci_dev *pdev)
+{
+	pci_info(pdev, "Setting PLX NTB proxy ID aliases\n");
+	/* PLX NTB may use all 256 devfns */
+	pci_add_dma_alias(pdev, 0, 256);
+}
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PLX, 0x87b0, quirk_plx_ntb_dma_alias);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PLX, 0x87b1, quirk_plx_ntb_dma_alias);
+
 /*
  * On Lenovo Thinkpad P50 SKUs with a Nvidia Quadro M1000M, the BIOS does
  * not always reset the secondary Nvidia GPU between reboots if the system
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
