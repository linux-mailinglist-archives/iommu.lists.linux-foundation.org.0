Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B89041E0DC7
	for <lists.iommu@lfdr.de>; Mon, 25 May 2020 13:51:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6204F86A14;
	Mon, 25 May 2020 11:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ERQt0h89GudC; Mon, 25 May 2020 11:51:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA157869F2;
	Mon, 25 May 2020 11:51:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7C60C016F;
	Mon, 25 May 2020 11:51:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B81CEC016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 11:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0FE585FA8
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 11:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flTjmLB7QYML for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 11:51:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B789685FA7
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 11:51:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 16104AD88;
 Mon, 25 May 2020 11:51:28 +0000 (UTC)
Date: Mon, 25 May 2020 13:51:23 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: next/master bisection: baseline.login on panda
Message-ID: <20200525115123.GF5075@suse.de>
References: <5ec4eb8e.1c69fb81.19b63.0b07@mx.google.com>
 <d30e5ea4-85ae-75c2-2334-f9f951026afd@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d30e5ea4-85ae-75c2-2334-f9f951026afd@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Hi Guillaume,

On Wed, May 20, 2020 at 10:54:44AM +0100, Guillaume Tucker wrote:
> Please see the bisection report below about a boot failure.
> 
> Reports aren't automatically sent to the public while we're
> trialing new bisection features on kernelci.org but this one
> looks valid.
> 
> Unfortunately there isn't anything in the kernel log, it's
> probably crashing very early on.  The bisection was run on
> omap4-panda, and there seems to be the same issue on
> omap3-beagle-xm as it's also failing to boot.

The issue is likely a deadlock fixed by:

	https://lore.kernel.org/r/20200519132824.15163-1-joro@8bytes.org

The patch is already in the iommu-tree and should show up in linux-next
soon.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
