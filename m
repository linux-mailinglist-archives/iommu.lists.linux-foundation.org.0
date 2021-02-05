Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC85310939
	for <lists.iommu@lfdr.de>; Fri,  5 Feb 2021 11:36:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6B56686AFD;
	Fri,  5 Feb 2021 10:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WR3U5yCdB5h; Fri,  5 Feb 2021 10:36:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E4A686B01;
	Fri,  5 Feb 2021 10:36:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51658C1DA9;
	Fri,  5 Feb 2021 10:36:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3410C013A
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 10:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 99F748734C
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 10:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdDib0nub3qX for <iommu@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 10:36:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 088D38730F
 for <iommu@lists.linux-foundation.org>; Fri,  5 Feb 2021 10:36:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 40F1C68AFE; Fri,  5 Feb 2021 11:36:27 +0100 (CET)
Date: Fri, 5 Feb 2021 11:36:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH v2] dma-mapping: benchmark: pretend DMA is transmitting
Message-ID: <20210205103627.GB6694@lst.de>
References: <20210205020035.25340-1-song.bao.hua@hisilicon.com>
 <20210205092113.GA870@lst.de>
 <e4c784d93cdd41d285bdddb650fb9471@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4c784d93cdd41d285bdddb650fb9471@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Feb 05, 2021 at 10:32:26AM +0000, Song Bao Hua (Barry Song) wrote:
> I can keep the struct size unchanged by changing the struct to
> 
> struct map_benchmark {
> 	__u64 avg_map_100ns; /* average map latency in 100ns */
> 	__u64 map_stddev; /* standard deviation of map latency */
> 	__u64 avg_unmap_100ns; /* as above */
> 	__u64 unmap_stddev;
> 	__u32 threads; /* how many threads will do map/unmap in parallel */
> 	__u32 seconds; /* how long the test will last */
> 	__s32 node; /* which numa node this benchmark will run on */
> 	__u32 dma_bits; /* DMA addressing capability */
> 	__u32 dma_dir; /* DMA data direction */
> 	__u32 dma_trans_ns; /* time for DMA transmission in ns */
> 
> 	__u32 exp; /* For future use */
> 	__u64 expansion[9];	/* For future use */
> };
> 
> But the code is really ugly now.

Thats why we usually use __u8 fields for reserved field.  You might
consider just switching to that instead while you're at it. I guess
we'll just have to get the addition into 5.11 then to make sure we
don't release a kernel with the alignment fix.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
