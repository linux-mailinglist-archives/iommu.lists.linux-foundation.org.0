Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115517F36A
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 10:25:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 02A2888603;
	Tue, 10 Mar 2020 09:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3HjCJ6MZYSK; Tue, 10 Mar 2020 09:25:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1533B885D8;
	Tue, 10 Mar 2020 09:25:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3373C0177;
	Tue, 10 Mar 2020 09:25:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F636C0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 09:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8BE8986C51
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 09:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMu9X39bDfve for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 09:25:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D9E2A85EF3
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 09:25:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 99002AC84;
 Tue, 10 Mar 2020 09:25:07 +0000 (UTC)
Date: Tue, 10 Mar 2020 10:25:05 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [iommu:arm/omap 4/4]
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c:134:20: error: implicit
 declaration of function 'vmap'; did you mean 'bmap'?
Message-ID: <20200310092505.GD7028@suse.de>
References: <202003050833.Dk7aJf6k%lkp@intel.com>
 <CAJKOXPcXSJs=a1x3XWksHzJnS7pb+UesPeZ+_5J7_cyn3yUtBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJKOXPcXSJs=a1x3XWksHzJnS7pb+UesPeZ+_5J7_cyn3yUtBg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Heiko Stuebner <heiko@sntech.de>
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

On Thu, Mar 05, 2020 at 09:50:57AM +0100, Krzysztof Kozlowski wrote:
> +Cc Heiko,
> 
> This is already fixed in drm-misc here:
> https://patchwork.freedesktop.org/patch/347106/

Is it possible to carry this fix in the IOMMU tree?


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
