Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 558625689E7
	for <lists.iommu@lfdr.de>; Wed,  6 Jul 2022 15:44:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68D7260FEE;
	Wed,  6 Jul 2022 13:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68D7260FEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxgJPm-qSVES; Wed,  6 Jul 2022 13:44:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8983A60FE9;
	Wed,  6 Jul 2022 13:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8983A60FE9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53E6FC0077;
	Wed,  6 Jul 2022 13:44:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CEB7C002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7881E82C3E
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 13:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7881E82C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFp6z03822bs for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 13:44:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EC4A82AC6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EC4A82AC6
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 13:44:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 81CAF68AA6; Wed,  6 Jul 2022 15:44:47 +0200 (CEST)
Date: Wed, 6 Jul 2022 15:44:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v5 0/5] DMA mapping changes for SCSI core
Message-ID: <20220706134447.GA23753@lst.de>
References: <1656590892-42307-1-git-send-email-john.garry@huawei.com>
 <b5f80062-e8ef-9597-1b0c-393140950dfb@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5f80062-e8ef-9597-1b0c-393140950dfb@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux.dev, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, jejb@linux.ibm.com, robin.murphy@arm.com,
 damien.lemoal@opensource.wdc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com, linux-ide@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org, hch@lst.de
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

On Wed, Jul 06, 2022 at 02:40:44PM +0100, John Garry wrote:
> On 30/06/2022 13:08, John Garry wrote:
>
> Hi Christoph,
>
> Can you please consider picking up this series? A few things to note 
> beforehand:
>
> - I changed to only apply the mapping limit to SAS hosts in this version. I 
> would need a fresh ack from Martin for those SCSI parts, but wanted to make 
> sure you were ok with it.

Yes, I've mostly been waiting for an ACK from Martin.

> - Damien had some doubt on updating the shost max_sectors as opposed to the 
> per-request queue default, but I think he's ok with it - see patch 4/5

I'm fine either way.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
