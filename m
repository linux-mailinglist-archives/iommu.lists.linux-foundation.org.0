Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE92BA1EA
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 06:30:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8BF6A2DE28;
	Fri, 20 Nov 2020 05:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKNZzX1lItUl; Fri, 20 Nov 2020 05:30:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C786B2DE24;
	Fri, 20 Nov 2020 05:30:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA6E2C1D9F;
	Fri, 20 Nov 2020 05:30:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED45FC0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 05:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D2B7786A60
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 05:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpr39jErcMDR for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 05:30:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 86064870A4
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 05:30:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m13so8681328ioq.9
 for <iommu@lists.linux-foundation.org>; Thu, 19 Nov 2020 21:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRcCB+0d/+THcleGXpsHmeFsuUEX7prgA/r7g5goMgs=;
 b=X+Aq3YwzSwGhvP/e0i+IuVbMbyQTZSCRysWsd3OqVj87//mRB3V/YLTSHNZsxaORWj
 1KXTCYjyUp3/2Z9zqudwBQSuw8IBSATkTy0UvlTiJaSCLjJ6KMRm3H2ZETnE9iNKUdnj
 lBY0xPKh2uUxfWtWx4agxyo9Y0NU8BZDtMhAUZi7xOYFDMdqGrzLhOt2VSlEpsTS0H4R
 9EwQmbrtgjVqurBf4Kl/vrUdJiSAp4uqC9lNvSD8OnJ1jSK9R4vpRkfCSscMDN12uqdP
 JwCnBmgAS2Nsfyet+Xb5p4AhBenblWZPt+ybpKaMBl2myoqzH3AS/GayIn0oQ09BiXOi
 cetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRcCB+0d/+THcleGXpsHmeFsuUEX7prgA/r7g5goMgs=;
 b=RXhbNh/Y39fpORriFIcQJXijq8jalKdUCjg+9dhD/bnWZULzihr8wky7kpYkCe/NwK
 VIFxgr4Z78GK0JTwL8ncvflLVofwlAtMzYo9qBoYb0PB7RnvkchNVQkCjEruPcvQS48c
 6lg/oD0EhbqmNbwkkM9p7Q1Jv+XenBmvu+8M0mcgBzO9s6j+edQUZKrzUX2KJ3A2psdK
 fPATySHhaQjRgdyX5IArg/GSydBKhZAO1iqM4PQnG/6roqSQA2jFtH8QeTG1/elpG8cj
 9A7HiRUNfUWnBpiwzJYzAZOIdSNGIhN9Qh8pmseI6Op0wtbh70tS7/Dht5wP2w+FqV7b
 +EGg==
X-Gm-Message-State: AOAM532zXbhf96MRT/3bRSHMftE2yytxj1L4GDTou7mB+I0PKH0Ppwr/
 DZk2MSrBB+P+067NAQ+fmL8FB9jBd2t9+sOgV7lX5g==
X-Google-Smtp-Source: ABdhPJxvWl2kEt+gAhL8w8b0FjxyE1ijV9kgnPD7gx//s/TvbREuA8gWrdLOrOAIFSZllFXI3ABfREApFhu4yx/jCy8=
X-Received: by 2002:a05:6638:22bb:: with SMTP id
 z27mr18289084jas.47.1605850200674; 
 Thu, 19 Nov 2020 21:30:00 -0800 (PST)
MIME-Version: 1.0
References: <20201119174149.3860883-1-thierry.reding@gmail.com>
In-Reply-To: <20201119174149.3860883-1-thierry.reding@gmail.com>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Thu, 19 Nov 2020 23:29:48 -0600
Message-ID: <CAOCOHw5sAc=VnDy68yihniZ+nW6JYJeFckE9gPbJJgGCo5kcGQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module"
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jon Hunter <jonathanh@nvidia.com>,
 "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Will Deacon <will@kernel.org>
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

On Thu, Nov 19, 2020 at 11:42 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Commit d0511b5496c0 ("firmware: QCOM_SCM: Allow qcom_scm driver to be
> loadable as a permenent module") causes the ARM SMMU driver to be built
> as a loadable module when using the Aarch64 default configuration. This
> in turn causes problems because if the loadable module is not shipped
> in an initial ramdisk, then the deferred probe timeout mechanism will
> cause all SMMU masters to probe without SMMU support and fall back to
> just plain DMA ops (not IOMMU-backed).
>
> Once the system has mounted the rootfs, the ARM SMMU driver will then
> be loaded, but since the ARM SMMU driver faults by default, this causes
> a slew of SMMU faults for the SMMU masters that have already been set
> up with plain DMA ops and cause these devices to malfunction.
>

FWIW I had the same issues on the Qualcomm platform and merged a patch
that turns QCOM_SCM=y in arm64 defconfig earlier today. So this should
hide the problem in next linux-next. (And it really should be =y in
defconfig regardless of this revert or not).

> Revert that commit to unbreak things while we look for an alternative
> solution.
>

I don't fancy the fact that we have a situation where if you're
unlucky to have probe deferrals lingering past late initcall things
will start to just break and this from a growing number of resource
types. But I also don't see any alternatives to fixing the kernel to
handle this gracefully.

Regards,
Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
