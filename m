Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6415B175
	for <lists.iommu@lfdr.de>; Wed, 12 Feb 2020 21:00:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DB4586959;
	Wed, 12 Feb 2020 20:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id extwLi1eOADg; Wed, 12 Feb 2020 20:00:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5ABC86919;
	Wed, 12 Feb 2020 20:00:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC1D7C0177;
	Wed, 12 Feb 2020 20:00:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 474DFC0177
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 20:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3043787DDB
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 20:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoyIlOR3tFqt for <iommu@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 20:00:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4EC9887D46
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 20:00:00 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a22so3246226oid.13
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 12:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQdM7QBHmlDS0OUFVBlwMq3kXCUqy/frsiXVn9/S5OI=;
 b=EEcVj0VEvYqUb2T689NAE90AjIJMhQEwAck93SBMCGaekAYpwua3i81QO7V0OZGcv8
 pqCHyAmHypL/MgMqvpgg4iWtVmgxs4CQZQJev8ovnfHb4vzH5//RFNU1Ew85UUQ/a6g5
 lgfMySk0D8vBBvv5zd6hBQtiMrfLlW5gKpcGZ8swP6DXQWOvV6HopKdhh4NzVyT6g6Ta
 4EkVt84GCm/VIO4MFepyeRbaQLLt0qdJkzYXAYT5kSGK8vOa/GJVQuCZVF+G9AfL+b2e
 6jSlLUb3pAmJBmObFdnb4F7CsogBfwPYQTxX0He58bGgM5M4/39JnjUpoAtJv8aU8Bm+
 iOBw==
X-Gm-Message-State: APjAAAX8qt6iRrargjdjery+BBUt+wEQiRz1VsX/TrsqU00PS8S7/xye
 PnhI/lNtXUUW8fVUVw70HRvlH76X
X-Google-Smtp-Source: APXvYqwJbb8FaKuy2ZsZAUtZ8bC2w2+I42Sxq7/z7Y/WNV62xmy3o9G0Vi3O8+DjqVCygeXa9xPygg==
X-Received: by 2002:aca:5dc3:: with SMTP id r186mr502662oib.137.1581537599044; 
 Wed, 12 Feb 2020 11:59:59 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com.
 [209.85.167.182])
 by smtp.gmail.com with ESMTPSA id x15sm748otq.30.2020.02.12.11.59.58
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 11:59:58 -0800 (PST)
Received: by mail-oi1-f182.google.com with SMTP id l136so3301960oig.1
 for <iommu@lists.linux-foundation.org>; Wed, 12 Feb 2020 11:59:58 -0800 (PST)
X-Received: by 2002:aca:6749:: with SMTP id b9mr500523oiy.13.1581537597909;
 Wed, 12 Feb 2020 11:59:57 -0800 (PST)
MIME-Version: 1.0
References: <1581467841-25397-1-git-send-email-leoyang.li@nxp.com>
 <20200212104902.GA3664@willie-the-truck>
In-Reply-To: <20200212104902.GA3664@willie-the-truck>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 12 Feb 2020 13:59:46 -0600
X-Gmail-Original-Message-ID: <CADRPPNQ-FcA-xdjp02ybsYeU9UFxCZU5dpf0wHThTmLHcjovCQ@mail.gmail.com>
Message-ID: <CADRPPNQ-FcA-xdjp02ybsYeU9UFxCZU5dpf0wHThTmLHcjovCQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: fix the module name to be consistent with
 older kernel
To: Will Deacon <will@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Wed, Feb 12, 2020 at 4:50 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Feb 11, 2020 at 06:37:20PM -0600, Li Yang wrote:
> > Commit cd221bd24ff5 ("iommu/arm-smmu: Allow building as a module")
> > introduced a side effect that changed the module name from arm-smmu to
> > arm-smmu-mod.  This breaks the users of kernel parameters for the driver
> > (e.g. arm-smmu.disable_bypass).  This patch changes the module name back
> > to be consistent.
> >
> > Signed-off-by: Li Yang <leoyang.li@nxp.com>
> > ---
> >  drivers/iommu/Makefile                          | 4 ++--
> >  drivers/iommu/{arm-smmu.c => arm-smmu-common.c} | 0
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename drivers/iommu/{arm-smmu.c => arm-smmu-common.c} (100%)
>
> Can't we just override MODULE_PARAM_PREFIX instead of renaming the file?

I can do that.  But on the other hand, the "mod" in the module name
arm-smmu-mod.ko seems to be redundant and looks a little bit weird.
Wouldn't it be cleaner to make it just arm-smmu.ko?

Regards,
Leo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
