Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0B1D5501
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 17:46:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B966487D8A;
	Fri, 15 May 2020 15:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Uzn2BivAuwg; Fri, 15 May 2020 15:46:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3837687D92;
	Fri, 15 May 2020 15:46:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 197E7C016F;
	Fri, 15 May 2020 15:46:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31A59C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 15:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 16B1987D92
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 15:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZESyth-jqBCh for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 15:46:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2976187D8A
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 15:46:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BD81B3C3; Fri, 15 May 2020 17:46:17 +0200 (CEST)
Date: Fri, 15 May 2020 17:46:16 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu: Remove functions that support private domain
Message-ID: <20200515154616.GY18353@8bytes.org>
References: <20200513224721.20504-1-sai.praneeth.prakhya@intel.com>
 <20200514131315.GJ18353@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573A6427@ORSMSX114.amr.corp.intel.com>
 <20200514183233.GO18353@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573A651E@ORSMSX114.amr.corp.intel.com>
 <20200514195615.GP18353@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573A6672@ORSMSX114.amr.corp.intel.com>
 <20200515095919.GQ18353@8bytes.org>
 <9d65b30a-d22e-d566-d740-601f8d638bfd@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d65b30a-d22e-d566-d740-601f8d638bfd@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On Fri, May 15, 2020 at 08:55:42PM +0800, Lu Baolu wrote:
> It seems that we can do like this:
> 
> [1] mutex_lock(&group->lock)
> [2] for_each_group_device(device_lock())
> [3] if (for_each_group_device(!device_is_bound()))
> 	change_default_domain()
> [4] for_each_group_device_reverse(device_unlock())
> [5] mutex_unlock(&group->lock)

The problem here is that I am pretty sure we also have:

	device_lock() /* from device/driver core code */
	-> bus_notifier()
	  -> iommu_bus_notifier()
	    -> ...
	      -> mutex_lock(&group->lock)

Which would cause lock-inversion with the above code.


	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
