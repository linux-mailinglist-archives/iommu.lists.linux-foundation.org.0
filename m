Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48370142069
	for <lists.iommu@lfdr.de>; Sun, 19 Jan 2020 23:18:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFCC981B8A;
	Sun, 19 Jan 2020 22:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnOoidnoV8IX; Sun, 19 Jan 2020 22:18:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 09FED817FB;
	Sun, 19 Jan 2020 22:18:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC20BC0174;
	Sun, 19 Jan 2020 22:18:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCBACC0174
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 22:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C39152001A
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 22:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKJselucDkO4 for <iommu@lists.linux-foundation.org>;
 Sun, 19 Jan 2020 22:18:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 6B1C41FE65
 for <iommu@lists.linux-foundation.org>; Sun, 19 Jan 2020 22:18:48 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8E9FB68B20; Sun, 19 Jan 2020 23:18:43 +0100 (CET)
Date: Sun, 19 Jan 2020 23:18:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH v4 4/7] iommu/vt-d: Use pci_real_dma_dev() for mapping
Message-ID: <20200119221843.GA4759@lst.de>
References: <1579278449-174098-1-git-send-email-jonathan.derrick@intel.com>
 <1579278449-174098-5-git-send-email-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579278449-174098-5-git-send-email-jonathan.derrick@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On Fri, Jan 17, 2020 at 09:27:26AM -0700, Jon Derrick wrote:
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev;
> +
> +		pdev = pci_real_dma_dev(to_pci_dev(dev));
> +		dev = &pdev->dev;

I think this could be simplified to

	if (dev_is_pci(dev))
		dev = &pci_real_dma_dev(to_pci_dev(dev)->dev;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
