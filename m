Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6C17A1B2
	for <lists.iommu@lfdr.de>; Thu,  5 Mar 2020 09:51:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F374E86053;
	Thu,  5 Mar 2020 08:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFswdCLmQAxG; Thu,  5 Mar 2020 08:51:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5C8685F84;
	Thu,  5 Mar 2020 08:51:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6919C013E;
	Thu,  5 Mar 2020 08:51:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 536E8C013E
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 08:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3B318869D7
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 08:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8Jo0xVbbg2k for <iommu@lists.linux-foundation.org>;
 Thu,  5 Mar 2020 08:51:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3A709869BF
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 08:51:11 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3AA421741
 for <iommu@lists.linux-foundation.org>; Thu,  5 Mar 2020 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583398271;
 bh=NQ89Py++OW8FPWud6OnvZ7Oda/EbjlSiQysG0UhHx5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pyphknGZJavWTEpyIMw/sM0Ee7wVmALhpDf5MShWAXrO98ButtofQv4rQ38t+Ji4N
 R+4ljIIZPECm1xLr/L9uLa9BGSbCE7l45oTSXWRxZ4aNilXW8uS8QSdreMc7IrIQh1
 oORZv29OJeqlbbUppkyOWdrkJ2sUUfs1lVPF1fak=
Received: by mail-lj1-f174.google.com with SMTP id f13so5153391ljp.0
 for <iommu@lists.linux-foundation.org>; Thu, 05 Mar 2020 00:51:10 -0800 (PST)
X-Gm-Message-State: ANhLgQ2o4qkqdNmU2ENFxCo5TwpNUepV7rxBfEJdGdu6bNlj6UOm8tWd
 eT7ZnsANcDmc+THV+MHec8Yd/hKrKP0KJ34mtg4=
X-Google-Smtp-Source: ADFU+vt4i6Grw804YCUgwxc6mKxocVT/oFHElHn37BS3P0va7qSqShENgixGf9g/eUTdJW4G7AaX+4yx2agr+8mpoFc=
X-Received: by 2002:a2e:9252:: with SMTP id v18mr1635792ljg.114.1583398268744; 
 Thu, 05 Mar 2020 00:51:08 -0800 (PST)
MIME-Version: 1.0
References: <202003050833.Dk7aJf6k%lkp@intel.com>
In-Reply-To: <202003050833.Dk7aJf6k%lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 5 Mar 2020 09:50:57 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcXSJs=a1x3XWksHzJnS7pb+UesPeZ+_5J7_cyn3yUtBg@mail.gmail.com>
Message-ID: <CAJKOXPcXSJs=a1x3XWksHzJnS7pb+UesPeZ+_5J7_cyn3yUtBg@mail.gmail.com>
Subject: Re: [iommu:arm/omap 4/4]
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c:134:20:
 error: implicit declaration of function 'vmap'; did you mean 'bmap'?
To: kbuild test robot <lkp@intel.com>
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 kbuild-all@lists.01.org, Heiko Stuebner <heiko@sntech.de>
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

On Thu, 5 Mar 2020 at 02:00, kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git arm/omap
> head:   e93a1695d7fb551376b1c1220a267d032b6ad159
> commit: e93a1695d7fb551376b1c1220a267d032b6ad159 [4/4] iommu: Enable compile testing for some of drivers
> config: sparc-allyesconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e93a1695d7fb551376b1c1220a267d032b6ad159
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=sparc
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/rockchip/rockchip_drm_gem.c: In function 'rockchip_gem_alloc_iommu':
> >> drivers/gpu/drm/rockchip/rockchip_drm_gem.c:134:20: error: implicit declaration of function 'vmap'; did you mean 'bmap'? [-Werror=implicit-function-declaration]
>       rk_obj->kvaddr = vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
>                        ^~~~
>                        bmap
> >> drivers/gpu/drm/rockchip/rockchip_drm_gem.c:134:59: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MPX'?
>       rk_obj->kvaddr = vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
>                                                               ^~~~~~
>                                                               VM_MPX
>    drivers/gpu/drm/rockchip/rockchip_drm_gem.c:134:59: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/gpu/drm/rockchip/rockchip_drm_gem.c: In function 'rockchip_gem_free_iommu':
> >> drivers/gpu/drm/rockchip/rockchip_drm_gem.c:190:2: error: implicit declaration of function 'vunmap'; did you mean 'iounmap'? [-Werror=implicit-function-declaration]
>      vunmap(rk_obj->kvaddr);
>      ^~~~~~
>      iounmap
>    drivers/gpu/drm/rockchip/rockchip_drm_gem.c: In function 'rockchip_gem_prime_vmap':
>    drivers/gpu/drm/rockchip/rockchip_drm_gem.c:547:49: error: 'VM_MAP' undeclared (first use in this function); did you mean 'VM_MPX'?
>       return vmap(rk_obj->pages, rk_obj->num_pages, VM_MAP,
>                                                     ^~~~~~
>                                                     VM_MPX
>    cc1: some warnings being treated as errors
>
> vim +134 drivers/gpu/drm/rockchip/rockchip_drm_gem.c

Hi,

+Cc Heiko,

This is already fixed in drm-misc here:
https://patchwork.freedesktop.org/patch/347106/

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
