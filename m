Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DE24F09E
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 02:04:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C9ECE85CD8;
	Mon, 24 Aug 2020 00:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ce-NN8oN4W8T; Mon, 24 Aug 2020 00:04:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 02BD585C7A;
	Mon, 24 Aug 2020 00:04:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9E8CC0051;
	Mon, 24 Aug 2020 00:04:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B4DEC0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 00:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E4CBB86E1F
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 00:04:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRsqhaNj4bix for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 00:04:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 38DA686C11
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 00:04:47 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t4so5829015iln.1
 for <iommu@lists.linux-foundation.org>; Sun, 23 Aug 2020 17:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qvzvkep7ZlQHNyjrGsuXQAp+x7s+RjdNiOv81NxtoQ=;
 b=ph3cmZeijsQTsHnHnrr9eCGgxMPexaLwCGnu3F9Od9T7oE9SJ1xriseSecoaLR+A31
 cxdttU99z8vHmtpSvs9wLGOOgPOY6GzwuKuovZh4UMjplaxKJu/wyAtKKGV99cTnuUCc
 b9jW667DJd78gpOSqL093TQrnCvZ9zpW4sDgc9e3s4gqdpHbIh0cqwIbSVLaQrTLqDAX
 thER0vKrZAtqkOJvYQeGZuITMeh4kPZ6AWC1kOvIEmnWvuxZr35lD2OOnlXMpkqB5GBo
 XlqFU7D/ggoXmysuTUVEiDWk1jvnBEMzHRuwpliqu/K2HYrSEPvB6WXxqYArt4mYifKa
 QdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qvzvkep7ZlQHNyjrGsuXQAp+x7s+RjdNiOv81NxtoQ=;
 b=durn2wjTyLiTdrX0nT4Kw5Ib0EPgfRnrBcMEHMqrWgvk2pvJeD8lRrXH2dthLjN3Gr
 +8GW7583BvErRupsyNBaPVNrICjW/Vt5m6feHmcajN5uWFDD5OQAbJYTRWlYzpRnF1/X
 U/WvWii7nO7PL5KOiwryY3QOl1fPsih3owA1O0wAfbfyNjaXPWA443h87ujjxnPZECpx
 cyqs503zDF3H5XHBBmzOTV/OiQTXDfHPaSc5G5dtnaV/sKL6TC2DiY/hep9LiqGLajzD
 YBqmwrBdOdCpcTb59VSLJAfe96i6Es9Xp07ubipREOlnWPE5oAAcCDPegrTy11QvOI8K
 QD2A==
X-Gm-Message-State: AOAM533oyP4QhEtclpFt9i+Nsv0dx5iqdUPrG1cv2ka6vjQvItPdcz9j
 FFBm4ehiWhAjz3RTkKgoldQuio97Ppb/0prwEWN0Tw==
X-Google-Smtp-Source: ABdhPJx+Rb9Dh5afCkPV93ubbfa83YINwHuyBNL6aGGIC9gNFt/GVdQQ5DqMV2LQPpqLPd5cGrS+QMzugsAJ9rHE3h4=
X-Received: by 2002:a92:4f:: with SMTP id 76mr2640989ila.11.1598227486317;
 Sun, 23 Aug 2020 17:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
In-Reply-To: <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Mon, 24 Aug 2020 01:04:35 +0100
Message-ID: <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Logan Gunthorpe <logang@deltatee.com>
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Julien Grall <julien.grall@arm.com>, Thierry Reding <thierry.reding@gmail.com>,
 Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

Hi Logan/All,

I have added a check for the sg_dma_len == 0 :
"""
 } __sgt_iter(struct scatterlist *sgl, bool dma) {
        struct sgt_iter s = { .sgp = sgl };

+       if (sgl && sg_dma_len(sgl) == 0)
+           s.sgp = NULL;

        if (s.sgp) {
            .....
"""
at location [1].
but it doens't fix the problem.

You're right though, this change does need to be made, this code
doesn't handle pages of sg_dma_len(sg) == 0 correctly
So my guess is that we have more bugs in other parts of the i915
driver (or there is a problem with my "sg_dma_len == 0" fix above).
I have been trying to spot where else the code might be buggy but I
haven't had any luck so far.

I'm doing a microconfernce (at LPC 2020) this wednesdays [1] on this
if you're interested in attending.
I'm hoping I can chat about it with a few people and find how can
reproduce and fix this issues. I don't have any more time I can give
to this unfortunately and it would be a shame for the work to go to
waste.

[0] https://github.com/torvalds/linux/blob/d012a7190fc1fd72ed48911e77ca97ba4521bccd/drivers/gpu/drm/i915/i915_scatterlist.h#L28
[1] https://linuxplumbersconf.org/event/7/contributions/846/

On Fri, 29 May 2020 at 22:21, Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-05-29 3:11 p.m., Marek Szyprowski wrote:
> > Patches are pending:
> > https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
>
> Cool, nice! Though, I still don't think that fixes the issue in
> i915_scatterlist.h given it still ignores sg_dma_len() and strictly
> relies on sg_next()/sg_is_last() to stop iterating -- and I suspect this
> is the bug that got in Tom's way.
>
> >> However, as Robin pointed out, there are other ugly tricks like stopping
> >> iterating through the SGL when sg_dma_len() is zero. For example, the
> >> AMD driver appears to use drm_prime_sg_to_page_addr_arrays() which does
> >> this trick and thus likely isn't buggy (otherwise, I'd expect someone to
> >> have complained by now seeing AMD has already switched to IOMMU-DMA.
> >
> > I'm not sure that this is a trick. Stopping at zero sg_dma_len() was
> > somewhere documented.
>
> Well whatever you want to call it, it is ugly to have some drivers doing
> one thing with the returned value and others assuming there's an extra
> zero at the end. It just causes confusion for people reading/copying the
> code. It would be better if they are all consistent. However, I concede
> stopping at zero should not be broken, presently.
>
> Logan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
