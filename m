Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9070E3DE403
	for <lists.iommu@lfdr.de>; Tue,  3 Aug 2021 03:31:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 185E1401F2;
	Tue,  3 Aug 2021 01:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXBoPjg_ufVW; Tue,  3 Aug 2021 01:31:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CCDE1401F1;
	Tue,  3 Aug 2021 01:31:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F1C3C001F;
	Tue,  3 Aug 2021 01:31:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B78BC000E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 01:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 656E4401F1
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 01:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPCXqar4RJPO for <iommu@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 01:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EBCE401C9
 for <iommu@lists.linux-foundation.org>; Tue,  3 Aug 2021 01:31:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so1069462wmg.4
 for <iommu@lists.linux-foundation.org>; Mon, 02 Aug 2021 18:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoYKeNMcKT9d+jkGEnzy+zqeIUVXh9cRA8f49lcGYC8=;
 b=K4cUt6vdJtIGAoypcfbhOnCY7xrdQNo/3h5B6VyuGQC6ZNWK/BBe++Xkxp67ld0Rn0
 Zh1pJzHrvpzYLV1x4DFyxUiEyQ46SCW4/9Oh792YF+bcXDwFnTL1anQNGnPNR12vVrKh
 WS89KEbB9yo18n717VtF6iTXDAQi6CVZ24pgQjC7Q7vZZ0qvVDrCemM4HWR4/0t6pRvb
 0YgX1LDLC5ekVWNwayNpI0OPAKJP7zmlBTS0tXXOEjxbgVf3n0We5wttMwz2tAfm+Yoe
 EhkzubmCCp386nRqW3vNJdOhPwdOWwFQTkeZrUrwSgV/s+ewosTRt+Dpoy174Qz0n96d
 atfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoYKeNMcKT9d+jkGEnzy+zqeIUVXh9cRA8f49lcGYC8=;
 b=iR8mLDidlZHdwVJBRNfDVxwXMx5/8lihXNzRoe+G5LuYCwT2wSdfoXWsKXrhqbCzf4
 MkFDf77oHIwBI8oUpanRkw3VjIyO0bGUOBgSl3g1b6QY3P84ErbL+L7r6K3ydzqUTsxB
 2a21GqLKKCkJZGOnwvoB7NvZkclyhROUi0Ck8ftew0+perL8p1Fj32Lyk/KobBVxJvdu
 +NWfxCP2/MPv/gNFO8d2U92NqNkAX9EjMSYf7Q5BTi/LTjM20o50fDhOLjIVrFjM72vc
 0gVV1VpKl/zL1zX9NCrVSJFVq460Ahe6Z8AwixT/klWyGdlOZSI/YBRx3ze5rNZl3wZp
 mcaQ==
X-Gm-Message-State: AOAM530k9C2jqEYP6oQOCvnGJ/CuPYTYSG0ybxaYl29acNtKbnTmE+50
 UqXuprbD5COHpllqflDmkTrpZ7KsRaZjhBdoes0=
X-Google-Smtp-Source: ABdhPJxdMWZqPHrh+Mxx9qIF7HQSUcdRyEEsbC9X4CVXONVLsF849KG7gxpA1BIWW/BxUAjLxanM9tlNbBcIasoLz7Q=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr1613548wma.49.1627954311450; 
 Mon, 02 Aug 2021 18:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
In-Reply-To: <20210802151409.GE28735@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 2 Aug 2021 18:36:04 -0700
Message-ID: <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
To: Will Deacon <will@kernel.org>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > >
> > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > and makes GPU the user of this protection flag.
> > > > >
> > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > not apply anymore?
> > > > >
> > > >
> > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > I can repost the patch.
> > >
> > > I still think you need to handle the mismatched alias, no? You're adding
> > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > can't be right.
> > >
> >
> > Just curious, and maybe this is a dumb question, but what is your
> > concern about mismatched aliases?  I mean the cache hierarchy on the
> > GPU device side (anything beyond the LLC) is pretty different and
> > doesn't really care about the smmu pgtable attributes..
>
> If the CPU accesses a shared buffer with different attributes to those which
> the device is using then you fall into the "mismatched memory attributes"
> part of the Arm architecture. It's reasonably unforgiving (you should go and
> read it) and in some cases can apply to speculative accesses as well, but
> the end result is typically loss of coherency.

Ok, I might have a few other sections to read first to decipher the
terminology..

But my understanding of LLC is that it looks just like system memory
to the CPU and GPU (I think that would make it "the point of
coherence" between the GPU and CPU?)  If that is true, shouldn't it be
invisible from the point of view of different CPU mapping options?

BR,
-R
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
