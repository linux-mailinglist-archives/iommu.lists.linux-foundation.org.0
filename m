Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE025EB74
	for <lists.iommu@lfdr.de>; Sun,  6 Sep 2020 00:26:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5D1D8762D;
	Sat,  5 Sep 2020 22:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IHTZmLofr6LF; Sat,  5 Sep 2020 22:26:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E0C587630;
	Sat,  5 Sep 2020 22:26:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EAAFC0052;
	Sat,  5 Sep 2020 22:26:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 681AFC0051
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 22:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 52B5986268
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 22:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcKcmrW7uhuE for <iommu@lists.linux-foundation.org>;
 Sat,  5 Sep 2020 22:26:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7629F861F6
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 22:26:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v4so9853032wmj.5
 for <iommu@lists.linux-foundation.org>; Sat, 05 Sep 2020 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kO4SU6/nW/siFVjam2OIPJSAFbObCvonF2HPGFhSHaM=;
 b=Tc7Ywq7Bfefla4wdZkAi4wzRtTHA3HZUo4yG10hl3Ve8gqdwLwePdy2g+5uZZOyLQ+
 H9nqqKVopB43C5zDytiFXIINTJwIbwOicfW9vNOZO0vgzeRzgzGqpaSrRECaj+ZMX4oy
 q4bPV5MgL5qFWx8UMO8/ayIus6y68lpXUhGi7JYEOKOHaoI1i5pU7uNirFdQ7v/3hcHJ
 HYnQKYASgQdDUpkx6yPxYFlhKC4W5vk6PfRqBe5DtZOi5Z6BzyC7LPxwevz4l3sYKHTP
 NWFnldyRzysAPx8WshWYSkfs2QPTMldmCVx+ylf/JskXeQCiqGbQryyQz2KrpaPLj+BY
 Xg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kO4SU6/nW/siFVjam2OIPJSAFbObCvonF2HPGFhSHaM=;
 b=mVdpl7A51brgPp1UkBpObTvuXRI/PtO8CrojQyzmV8sMkvqYjxWphHzYIGzMAT44EI
 +7/6zmV8e2dKBQxtSh0QztgAeVtGPGis4bQe0OZTo1/VT7r1et5S6XW7xGhQzEN6yXCO
 grNp9MBxHAkCxgBa771PMl3uiPBtIO4Q1L5JNfm+2Q+y7jDvc7F3C2JlUWeLF3Lezj7j
 Lox6j47fF9ba5Ps83mtSMTyhuTZJKAPzfRhTYQwzFi5ZscnVJJ+DUA9zk94KjX5EHR6g
 fTMXUyaKU19yyiO8fnNfRvwPn60s5NgJUPRgxVjElUTvzhN6q1G3Ie4b10HFksYYbPNY
 L+mA==
X-Gm-Message-State: AOAM531cJ7/Wuir/ig27FWbPG0QpplxRBl/8XODDNmKSnEaEGtBtc6gS
 15me1MBvKj6etRlYO5Hjf9M+R8VbbPt7huXK42A=
X-Google-Smtp-Source: ABdhPJyIvQBjARmaml3HdYHp3K3skBZfLZ/a5IEU5bZh9cOSWS4faIxFjRpnaNu/Ls10Q59QEyZ1Zdl8lMeKtjk49KU=
X-Received: by 2002:a1c:105:: with SMTP id 5mr13507006wmb.175.1599344778745;
 Sat, 05 Sep 2020 15:26:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 5 Sep 2020 15:27:14 -0700
Message-ID: <CAF6AEGvxcYKOgZ2HFdJod4q=jS27TpR28727FzbdJD4gOTYOVw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] iommu/arm-smmu: Support maintaining bootloader
 mappings
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sibi Sankar <sibis@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
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

On Fri, Sep 4, 2020 at 8:55 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
>
> Per Will's request this builds on the work by Jordan and Rob for the Adreno
> SMMU support. It applies cleanly ontop of v16 of their series, which can be
> found at
> https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/
>
> Bjorn Andersson (8):
>   iommu/arm-smmu: Refactor context bank allocation
>   iommu/arm-smmu: Delay modifying domain during init
>   iommu/arm-smmu: Consult context bank allocator for identify domains
>   iommu/arm-smmu-qcom: Emulate bypass by using context banks
>   iommu/arm-smmu-qcom: Consistently initialize stream mappings
>   iommu/arm-smmu: Add impl hook for inherit boot mappings
>   iommu/arm-smmu: Provide helper for allocating identity domain
>   iommu/arm-smmu-qcom: Setup identity domain for boot mappings

I have squashed 1/8 into v17 of the adreno-smmu series as suggested by
Bjorn, the remainder are:

Reviewed-by: Rob Clark <robdclark@gmail.com>

and on the lenovo c630,

Tested-by: Rob Clark <robdclark@gmail.com>

>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 111 ++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 122 ++++++++++++++-------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  14 ++-
>  3 files changed, 205 insertions(+), 42 deletions(-)
>
> --
> 2.28.0
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
