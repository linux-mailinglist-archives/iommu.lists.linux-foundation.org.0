Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97F529D86
	for <lists.iommu@lfdr.de>; Tue, 17 May 2022 11:11:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CD24405C7;
	Tue, 17 May 2022 09:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFhzSHMntLPT; Tue, 17 May 2022 09:11:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2A44140BA8;
	Tue, 17 May 2022 09:11:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9EE9C002D;
	Tue, 17 May 2022 09:11:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04A81C002D
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 09:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E705A414A1
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 09:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgtCyvn5mRjd for <iommu@lists.linux-foundation.org>;
 Tue, 17 May 2022 09:11:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A1B2402C5
 for <iommu@lists.linux-foundation.org>; Tue, 17 May 2022 09:11:06 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7FE9E67373; Tue, 17 May 2022 11:11:02 +0200 (CEST)
Date: Tue, 17 May 2022 11:11:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.garry@huawei.com>
Subject: Re: [RFC PATCH] dma-iommu: Add iommu_dma_max_mapping_size()
Message-ID: <20220517091102.GB18723@lst.de>
References: <1652706361-92557-1-git-send-email-john.garry@huawei.com>
 <20220517083834.GA16965@lst.de>
 <3e7c4d27-a0cb-2d9e-ca79-248ce26c6787@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e7c4d27-a0cb-2d9e-ca79-248ce26c6787@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 Christoph Hellwig <hch@lst.de>, liyihang6@hisilicon.com
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

On Tue, May 17, 2022 at 10:02:00AM +0100, John Garry wrote:
> BTW, on a separate topic, I noticed that even with this change my ATA 
> devices have max_hw_sectors_kb of 32767, as opposed to 128 for SAS devices. 
> It seems that libata-scsi - specifically ata_scsi_dev_config() - doesn't 
> honour the shost max_sectors limit. I guess that is not intentional.

I don't think it is.  the libsas/libsata integration is a bit messy
sometimes..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
