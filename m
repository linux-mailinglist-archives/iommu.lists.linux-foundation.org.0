Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 437041D4A74
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 12:07:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6FF388DA4;
	Fri, 15 May 2020 10:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeDBm0FKxNjz; Fri, 15 May 2020 10:07:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2247088DA1;
	Fri, 15 May 2020 10:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0E0AC016F;
	Fri, 15 May 2020 10:07:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 323D8C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2EE948979E
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztWdHWXLtidn for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:07:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AEB088979C
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 10:07:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 27896379; Fri, 15 May 2020 12:07:20 +0200 (CEST)
Date: Fri, 15 May 2020 12:07:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2 23/33] iommu/mediatek-v1 Convert to
 probe/release_device() call-backs
Message-ID: <20200515100718.GS18353@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-24-joro@8bytes.org>
 <1589528699.26119.9.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589528699.26119.9.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi,

On Fri, May 15, 2020 at 03:44:59PM +0800, Yong Wu wrote:
> On Tue, 2020-04-14 at 15:15 +0200, Joerg Roedel wrote:
> > -	return iommu_device_link(&data->iommu, dev);
> > +	err = arm_iommu_attach_device(dev, mtk_mapping);
> > +	if (err)
> > +		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
> 
> 
> Hi Joerg,
> 
>      Thanks very much for this patch.
> 
>      This arm_iommu_attach_device is called just as we expected.
> 
>      But it will fail in this callstack as the group->mutex was tried to
> be re-locked...
> 
> [<c0938e8c>] (iommu_attach_device) from [<c0317590>]
> (__arm_iommu_attach_device+0x34/0x90)
> [<c0317590>] (__arm_iommu_attach_device) from [<c03175f8>]
> (arm_iommu_attach_device+0xc/0x20)
> [<c03175f8>] (arm_iommu_attach_device) from [<c09432cc>]
> (mtk_iommu_probe_finalize+0x34/0x50)
> [<c09432cc>] (mtk_iommu_probe_finalize) from [<c093a8ac>]
> (bus_iommu_probe+0x2a8/0x2c4)
> [<c093a8ac>] (bus_iommu_probe) from [<c093a950>] (bus_set_iommu
> +0x88/0xd4)
> [<c093a950>] (bus_set_iommu) from [<c0943c74>] (mtk_iommu_probe
> +0x2f8/0x364)

Thanks for the report, is

	https://lore.kernel.org/lkml/1589530123-30240-1-git-send-email-yong.wu@mediatek.com/

The fix for this issue or is something else required?


Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
