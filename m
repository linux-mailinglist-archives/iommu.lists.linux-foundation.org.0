Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC41D2E2B
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 13:23:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A83D387A0A;
	Thu, 14 May 2020 11:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pz2q7jCqcsz0; Thu, 14 May 2020 11:23:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B568879FE;
	Thu, 14 May 2020 11:23:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B29BC016F;
	Thu, 14 May 2020 11:23:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79A1DC016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 11:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75D60879FE
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 11:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gh5Jt2V2zNk8 for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 11:23:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9BE84879E7
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 11:23:23 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 490C9379; Thu, 14 May 2020 13:23:20 +0200 (CEST)
Date: Thu, 14 May 2020 13:23:17 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: next/master bisection: baseline.login on jetson-tk1
Message-ID: <20200514112317.GH18353@8bytes.org>
References: <5eb9fab4.1c69fb81.a1f1c.0e95@mx.google.com>
 <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
 <20200512151600.GD8135@suse.de>
 <c9745450-a6d0-1944-a9af-ef9ce18fed12@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9745450-a6d0-1944-a9af-ef9ce18fed12@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-next@vger.kernel.org, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org
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

On Wed, May 13, 2020 at 11:16:14PM +0100, Guillaume Tucker wrote:
> which this time gave me:
> 
> <4>[    2.540558] PC is at iommu_probe_device+0x1c/0x15c
> <4>[    2.545606] LR is at of_iommu_configure+0x15c/0x1c4
> <4>[    2.550736] pc : [<c092e0e4>]    lr : [<c0932c0c>]    psr: a0000013
> 
> which in turn brings us to:
> 
> (gdb) l *0xc092e0e4
> 0xc092e0e4 is in iommu_probe_device (drivers/iommu/iommu.c:232).
> 227		int ret;
> 228	
> 229		if (!dev_iommu_get(dev))
> 230			return -ENOMEM;
> 231	
> 232		if (!try_module_get(ops->owner)) {
> 233			ret = -EINVAL;
> 234			goto err_out;
> 235		}
> 236

Okay, so ops is NULL. I queued a fix for that in the iommu-tree. If you
test the latest master branch the problem should be gone.

Thanks for the report,


       Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
