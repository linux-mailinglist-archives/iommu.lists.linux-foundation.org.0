Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870C3127B0
	for <lists.iommu@lfdr.de>; Sun,  7 Feb 2021 22:51:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7AB92034D;
	Sun,  7 Feb 2021 21:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwzBYHh53UTb; Sun,  7 Feb 2021 21:51:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 109C920468;
	Sun,  7 Feb 2021 21:51:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF631C013A;
	Sun,  7 Feb 2021 21:51:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1393C013A
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 21:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B8CD0854D0
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 21:51:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yrpNxjYYuUn for <iommu@lists.linux-foundation.org>;
 Sun,  7 Feb 2021 21:51:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA725854C9
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 21:51:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5631764E42
 for <iommu@lists.linux-foundation.org>; Sun,  7 Feb 2021 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612734685;
 bh=P4hDyuNTuefulj1FdkzvYzEyjfTpJGAPCBgeIztJKCM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aiqhgWBzXV4AzmQQ3FOIpJ+8g22/cdhbfgt1J5rc7iv8CNDMRsCNdIqJRBxuy++pF
 vSSeAM9wvJXq06Lww0xXRz1OLXhX1d59B76C8CcYQE/A8LT/GkDc7YlnUeYuyyArp9
 JNonboHjp/shpuCLJEFFcApxk/KOYx9m/eOm6biB7qgn5L9hMxMclfByBeRuLj9oms
 8zgWmgGkApMFjwpVPd7aZVjxqkhdul+WojsaSgdVwq4Anx2uZj79jxc8DMEIDQstXy
 g/Z9l8JumCrd3vhC+XaZbjK6hu5J5lspVB0tIM2OLMyS54aUxsyYEmUWPjnkDN10/3
 aG0/H10rqpiDg==
Received: by mail-oi1-f173.google.com with SMTP id u66so11820115oig.9
 for <iommu@lists.linux-foundation.org>; Sun, 07 Feb 2021 13:51:25 -0800 (PST)
X-Gm-Message-State: AOAM532N9MAOubFoG0Fz3m3xEWcrkx5gqx5LHIGZkBmou/zVGkcW2+Ra
 RX7iEgUuGA+q9mOwxxzlhAuS7HA47uyrjR19mrs=
X-Google-Smtp-Source: ABdhPJztcgMCwC5vEH2C09j7j+GkAttNY0a5GTpilwvVIo0NrUu5XPRToZOgdItl3JcOdDFgY9DlSYVlj5gq9JEHorc=
X-Received: by 2002:aca:2117:: with SMTP id 23mr318015oiz.4.1612734684591;
 Sun, 07 Feb 2021 13:51:24 -0800 (PST)
MIME-Version: 1.0
References: <1612685884-19514-1-git-send-email-wangzhou1@hisilicon.com>
 <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
In-Reply-To: <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 7 Feb 2021 22:51:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a13aGbqvTxL+5OQxu-wPa6RDHQJkJ_n8O6YeOibbJQ2yg@mail.gmail.com>
Message-ID: <CAK8P3a13aGbqvTxL+5OQxu-wPa6RDHQJkJ_n8O6YeOibbJQ2yg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 Sihang Chen <chensihang1@hisilicon.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, gregkh <gregkh@linuxfoundation.org>,
 Zhangfei Gao <zhangfei.gao@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Sun, Feb 7, 2021 at 9:18 AM Zhou Wang <wangzhou1@hisilicon.com> wrote:

> diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
> index cccfbbe..3f49529 100644
> --- a/arch/arm64/include/asm/unistd32.h
> +++ b/arch/arm64/include/asm/unistd32.h
> @@ -891,6 +891,8 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
>  __SYSCALL(__NR_process_madvise, sys_process_madvise)
>  #define __NR_epoll_pwait2 441
>  __SYSCALL(__NR_epoll_pwait2, compat_sys_epoll_pwait2)
> +#define __NR_mempinfd 442
> +__SYSCALL(__NR_mempinfd, sys_mempinfd)

This adds a compat syscall for 32-bit tasks running on arm64 without adding
the same for the native arch/arm syscall table. Those two need to always
stay synchronized. In fact, new system call should ideally get assigned
on all architectures at the same time, with the same number (or +110
on arch/alpha).

         Arnd
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
