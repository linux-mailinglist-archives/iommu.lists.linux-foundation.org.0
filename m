Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 26101243C3A
	for <lists.iommu@lfdr.de>; Thu, 13 Aug 2020 17:10:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD795879E1;
	Thu, 13 Aug 2020 15:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzpJzbPYoqeU; Thu, 13 Aug 2020 15:10:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F46188685;
	Thu, 13 Aug 2020 15:10:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1212BC004D;
	Thu, 13 Aug 2020 15:10:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F856C004D
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 15:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 00EC623115
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 15:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kZUOTgZAgQ0 for <iommu@lists.linux-foundation.org>;
 Thu, 13 Aug 2020 15:10:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by silver.osuosl.org (Postfix) with ESMTPS id DDB14203E9
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 15:10:18 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 3so5375473wmi.1
 for <iommu@lists.linux-foundation.org>; Thu, 13 Aug 2020 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nuLP0ucN1jD0A5G/rbjKQ0IWTQZyFeBE7AA1MgUnySo=;
 b=uHdjMt59zx0NWygGT00vboekxP3muBYPVwS1Set3BcG6z8f9Lx3CEiTDhCKPM9Fj7d
 H7Zghzlo38jK3BNe6Q/V7mEVtBr96Qd6pWv5YN+FQsLmKLzb+BlOtjhpLdyO7zcNasUt
 Py62w87WtnJ8ls6D/5boqyKOaxS1li243OWJHj/gZv6ssIWfKoSLql/plqXYDPQEamXA
 kWGIOT1W3eFYxHLOeKNUv8Ys9xi9IEJYuFhvnN4Wt4dpfnAnzIzV6XdJXgAqHTT1liH2
 vG81U09rx74e6TuMs+pYpJhfXRlGxsHZasQ6K4UUntka++VMsPreF97mb6jnlEVEK+lk
 FnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nuLP0ucN1jD0A5G/rbjKQ0IWTQZyFeBE7AA1MgUnySo=;
 b=JZcbP/sAlqzKru43oTdgT3ct53/LyWYiZKcnPWOeR1JxnJBddYqgrtXONACK0G12aR
 8Sc8cARUFeJiUoIZZWxKY1cHhundvaexJfYJ2fpY/Pq0XVXSzYP4Y8qlVMHb21KYTrY7
 mnsxKdoYM4PLeqFOdeG0/Vb7bWDQbiI21uXftCj44LTu1hFkY+JEaynL5Io2YBue5QAj
 N9pRdBWnEtlRfJkiNNuIaVWFDBknZJlsQXuPCxdkdoNAuN/ieybNqI4c5MOFvhiIJa/V
 bMB6wbJmljmkKG3qJEfl2PthttfnTDztqHM9adJ+shFzRmTZxlmuQ+WkqpCg31L2q4SY
 uXAQ==
X-Gm-Message-State: AOAM532brlVlYT9rLb6JJmU0tjWyik7bD9oSkLIHWOsewMF4fs+1yTbE
 y3wJBeKDNlAeztodZJ/YAEotUy86AoAqMeNoMfs=
X-Google-Smtp-Source: ABdhPJwyUB412yvyp91ddO2jHXQbWOlzquN4PZJB8fEibTvHbohj1VvNGz9vxVColKj4PFzWEixM2vzufgv+z0SGwwo=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr5049269wmf.49.1597331416969; 
 Thu, 13 Aug 2020 08:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org>
 <20200813131412.GB10256@willie-the-truck>
In-Reply-To: <20200813131412.GB10256@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Aug 2020 08:11:02 -0700
Message-ID: <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 04/13] iommu: Add a domain attribute to
 get/set a pagetable configuration
To: Will Deacon <will@kernel.org>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > arm-smmu to share the current pagetable configuration with the
> > leaf driver and to allow the leaf driver to set up a new pagetable
> > configuration under certain circumstances.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  include/linux/iommu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index fee209efb756..995ab8c47ef2 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -118,6 +118,7 @@ enum iommu_attr {
> >       DOMAIN_ATTR_FSL_PAMUV1,
> >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > +     DOMAIN_ATTR_PGTABLE_CFG,
> >       DOMAIN_ATTR_MAX,
> >  };
>
> Nobody other than the adreno gpu uses this, so can we avoid exposing it
> in the IOMMU API, please? Given that you have a reference to the adreno
> GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> can you squirrel some function pointers away in the driver data (i.e. with
> dev_set_drvdata()) instead?
>

Hmm, we are already using drvdata on the gpu side, and it looks like
arm-smmu is also using it.  Could we get away with stashing an extra
'void *' in iommu_domain itself?

Or alternatively, if we had a is_arm_smmu_domain(domain), then we
could just directly call some exported private fxns with the domain
ptr (which could then verify that the domain is actually an
arm_smmu_domain, and then from there that the smmu is indeed
qcom,adreno-smmu, to keep things sane)

BR,
-R
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
