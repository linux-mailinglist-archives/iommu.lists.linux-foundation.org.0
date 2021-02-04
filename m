Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1630FCD6
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 20:32:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6484A8725C;
	Thu,  4 Feb 2021 19:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2FKadkqB6y5; Thu,  4 Feb 2021 19:32:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 035E787245;
	Thu,  4 Feb 2021 19:32:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC3E9C013A;
	Thu,  4 Feb 2021 19:32:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6DFEC013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8EF7786AB8
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 19:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DLsL4j7bsfZ for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 19:32:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60BB486A77
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 19:32:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 590DD68C8C; Thu,  4 Feb 2021 20:32:31 +0100 (CET)
Date: Thu, 4 Feb 2021 20:32:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: jxgao@google.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 8/8] nvme-pci: set min_align_mask
Message-ID: <20210204193230.GA14946@lst.de>
References: <20210204193035.2606838-1-hch@lst.de>
 <20210204193035.2606838-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204193035.2606838-9-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: saravanak@google.com, konrad.wilk@oracle.com, marcorr@google.com,
 linux-nvme@lists.infradead.org, iommu@lists.linux-foundation.org,
 kbusch@kernel.org, robin.murphy@arm.com
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

> +	dma_set_min_align_mask(&pdev->dev, NVME_CTRL_PAGE_SIZE - 1);

And due to a last minute change from me this doesn't actually compile,
as pdev should be dev.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
