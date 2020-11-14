Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B222B2C7B
	for <lists.iommu@lfdr.de>; Sat, 14 Nov 2020 10:52:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 86014204DB;
	Sat, 14 Nov 2020 09:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKx21Tej93mm; Sat, 14 Nov 2020 09:52:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A2803204E2;
	Sat, 14 Nov 2020 09:52:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 797BBC0800;
	Sat, 14 Nov 2020 09:52:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9C8DC0800
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 09:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC478204E2
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 09:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTSyM-Rcl4fk for <iommu@lists.linux-foundation.org>;
 Sat, 14 Nov 2020 09:52:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 3FE40204DB
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 09:52:23 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A911267373; Sat, 14 Nov 2020 10:52:18 +0100 (CET)
Date: Sat, 14 Nov 2020 10:52:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 2/5] dma-direct: add dma_direct_bypass() to force
 direct ops
Message-ID: <20201114095218.GA19102@lst.de>
References: <20201106163437.30836-1-jonathan@marek.ca>
 <20201106163437.30836-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106163437.30836-3-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

So despite a week long wait I'e only received this patch from the
series.  Please resend the whole series if you want a review.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
