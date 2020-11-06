Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8342A9AE2
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 18:33:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0FDD786A47;
	Fri,  6 Nov 2020 17:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vW6-8EE9mfTh; Fri,  6 Nov 2020 17:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94C4386A51;
	Fri,  6 Nov 2020 17:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D228C0889;
	Fri,  6 Nov 2020 17:33:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A870C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7231E8753E
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNQASZ1Dv33o for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 17:33:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DFD5087021
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=70pLG2mtaM/qAjlvPwrCa6hi8Pb+2Avuax5NOW5ft8g=; b=e3fXrM2b1kZsOVGk71a7haq0Yp
 7RG4YrCC2Cvne+bpsEC97u/0eFwdO7jlz9n5RCpfzP00QkdA8tz+Sloo98K3ADKY31zjKlZYoH2Fe
 4KqIHoNPukgrMVovpVHxYynxmcjscoqsrc14DFp4ohfXt8/9zZNoUyliKyDpXULTWoJvcAheeNtjq
 s0jOQhPKtk2DJWT0QpFILMwfSdUfaK60IWJbF3zy02TVs1fQx1DzC9F0qZE75jj4T9Kba4o4iO+w6
 aGIgLGzkcsqi3VQQ2B/8rQHVeaxTNjjUSfVoEmeMpabF91WiheXZI+COO/yn48YuiyVSaKonNITku
 skfhLijA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1kb56Z-0002PW-5k; Fri, 06 Nov 2020 10:00:56 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
 (envelope-from <gunthorp@deltatee.com>)
 id 1kb56U-0004sq-64; Fri, 06 Nov 2020 10:00:46 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Fri,  6 Nov 2020 10:00:22 -0700
Message-Id: <20201106170036.18713-2-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201106170036.18713-1-logang@deltatee.com>
References: <20201106170036.18713-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, dan.j.williams@intel.com,
 iweiny@intel.com, jhubbard@nvidia.com, ddutile@redhat.com, willy@infradead.org,
 daniel.vetter@ffwll.ch, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [RFC PATCH 01/15] PCI/P2PDMA: Don't sleep in
 upstream_bridge_distance_warn()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: John Hubbard <jhubbard@nvidia.com>, Ira Weiny <iweiny@intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dan Williams <dan.j.williams@intel.com>, Stephen Bates <sbates@raithlin.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
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

In order to call this function from a dma_map function, it must not sleep.
The only reason it does sleep so to allocate the seqbuf to print
which devices are within the ACS path.

Switch the kmalloc call to use GFP_NOWAIT and simply not print that
message if the buffer fails to be allocated.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/pci/p2pdma.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index de1c331dbed4..94583779c36e 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -267,7 +267,7 @@ static int pci_bridge_has_acs_redir(struct pci_dev *pdev)
 
 static void seq_buf_print_bus_devfn(struct seq_buf *buf, struct pci_dev *pdev)
 {
-	if (!buf)
+	if (!buf || !buf->buffer)
 		return;
 
 	seq_buf_printf(buf, "%s;", pci_name(pdev));
@@ -501,19 +501,20 @@ upstream_bridge_distance_warn(struct pci_dev *provider, struct pci_dev *client,
 	bool acs_redirects;
 	int ret;
 
-	seq_buf_init(&acs_list, kmalloc(PAGE_SIZE, GFP_KERNEL), PAGE_SIZE);
-	if (!acs_list.buffer)
-		return -ENOMEM;
+	seq_buf_init(&acs_list, kmalloc(PAGE_SIZE, GFP_NOWAIT), PAGE_SIZE);
 
 	ret = upstream_bridge_distance(provider, client, dist, &acs_redirects,
 				       &acs_list);
 	if (acs_redirects) {
 		pci_warn(client, "ACS redirect is set between the client and provider (%s)\n",
 			 pci_name(provider));
-		/* Drop final semicolon */
-		acs_list.buffer[acs_list.len-1] = 0;
-		pci_warn(client, "to disable ACS redirect for this path, add the kernel parameter: pci=disable_acs_redir=%s\n",
-			 acs_list.buffer);
+
+		if (acs_list.buffer) {
+			/* Drop final semicolon */
+			acs_list.buffer[acs_list.len - 1] = 0;
+			pci_warn(client, "to disable ACS redirect for this path, add the kernel parameter: pci=disable_acs_redir=%s\n",
+				 acs_list.buffer);
+		}
 	}
 
 	if (ret == PCI_P2PDMA_MAP_NOT_SUPPORTED) {
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
