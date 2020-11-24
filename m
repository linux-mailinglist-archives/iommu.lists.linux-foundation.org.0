Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD82C3066
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 20:04:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A37BE872ED;
	Tue, 24 Nov 2020 19:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BH0KifHpSwm7; Tue, 24 Nov 2020 19:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 905BB872EC;
	Tue, 24 Nov 2020 19:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 656C1C0052;
	Tue, 24 Nov 2020 19:03:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37F12C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 19:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 181B6872ED
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 19:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZx1xJT3szCP for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 19:03:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D21AF872EC
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 19:03:53 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u12so23503699wrt.0
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kf8N/OmqZHAolew6L+ymXRNdjbnvIjwkoc3J3zrIO6o=;
 b=e4XPfFafIyuCJA3/oM5IEkO0sIKvTxq5TB/vBw5VApjZmswLIR+ss8JeVCBQc3S0YB
 utaTXD2KgvRBJSQYloFRQA3bwyim1R63U6DlE/t1zLaFkVf6C4xghKml39Z5tUdk8KE0
 FOyMsVp/6YNj0a+F4KKDzno65iOfoowVa0154Sled8pW+rU69gDbIGFGIs379KCmm2Bn
 ZxHpjoYkCCIPHBCgz4Q2ODoHHTiIRw2fRYAmW7CNSCRm8Dk2TSpWbBjoFGOb5k2sn5Wb
 xzKdxqm90TYqRiKn+hjfi33FMMy2DdVYzrfu8Tg/n3hBDZ3JwSpF8wCnmejQd5TfPZa2
 1Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kf8N/OmqZHAolew6L+ymXRNdjbnvIjwkoc3J3zrIO6o=;
 b=I5ax7ndfwlzADD1OycRWMh6Gn95snNZvIey6hNteC+e12E95mo/fj8njTwvScaYSkK
 omEg6EHmaOSfPydfkCNv1bfFzty8kIgzHfKjY8ZXCj2Vxc1c6Qkx/brX15sIgUxrgh40
 h9yNHbWATtXMr3IBwye9fFF3BT0LzEWaz7qXrdixiERzkK48KhR6ENHZ6Lvg/AVM7Nz+
 hwO96tjw76CNTauNDYNOL8A3i0vqdUquGbUMLWT5RgkqJPt93WdstDAoBuVv6KTRItR9
 csq7dwsgJOIyrHFZCyl/Te7AFyN+Wu9OmFqx1SQ7/FAO+MDoy5Jk3NU8fBRmHldP97D1
 MU9g==
X-Gm-Message-State: AOAM532ybtnf2O4qHEiWweZBSK5jB5lSaHR6sxJRxJc9oSkd2Z9Jcld5
 9JBn7tif27AamqYAbCPQ/t87NKQu7e+lxWdE15I=
X-Google-Smtp-Source: ABdhPJwW1Dno1QctDapnpNYSFC4x+KGmIfQzh+3Rg5OpwpAmPAHWb0eqXoADDsWEL4IzwAxlcJmhREL9yr7VY0C/XTc=
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr6621316wrp.147.1606244632292; 
 Tue, 24 Nov 2020 11:03:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
 <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
 <20201124111027.GA13151@willie-the-truck>
In-Reply-To: <20201124111027.GA13151@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Nov 2020 11:05:39 -0800
Message-ID: <CAF6AEGuZ2YbY=ATFBX1KJw=LwhcpH8n+zzxckTHPwwopi6mOqw@mail.gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>,
 " <iommu@lists.linux-foundation.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Dave Airlie <airlied@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
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

On Tue, Nov 24, 2020 at 3:10 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Nov 24, 2020 at 09:32:54AM +0530, Sai Prakash Ranjan wrote:
> > On 2020-11-24 00:52, Rob Clark wrote:
> > > On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > >
> > > > On 2020-11-23 20:51, Will Deacon wrote:
> > > > > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> > > > >> Some hardware variants contain a system cache or the last level
> > > > >> cache(llc). This cache is typically a large block which is shared
> > > > >> by multiple clients on the SOC. GPU uses the system cache to cache
> > > > >> both the GPU data buffers(like textures) as well the SMMU pagetables.
> > > > >> This helps with improved render performance as well as lower power
> > > > >> consumption by reducing the bus traffic to the system memory.
> > > > >>
> > > > >> The system cache architecture allows the cache to be split into slices
> > > > >> which then be used by multiple SOC clients. This patch series is an
> > > > >> effort to enable and use two of those slices preallocated for the GPU,
> > > > >> one for the GPU data buffers and another for the GPU SMMU hardware
> > > > >> pagetables.
> > > > >>
> > > > >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> > > > >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> > > > >>
> > > > >> Changes in v8:
> > > > >>  * Introduce a generic domain attribute for pagetable config (Will)
> > > > >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
> > > > >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
> > > > >> (Will)
> > > > >
> > > > > Modulo some minor comments I've made, this looks good to me. What is
> > > > > the
> > > > > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > > > > the
> > > > > MSM GPU driver and I'd like to avoid conflicts with that.
> > > > >
> > > >
> > > > SMMU bits are pretty much independent and GPU relies on the domain
> > > > attribute
> > > > and the quirk exposed, so as long as SMMU changes go in first it
> > > > should
> > > > be good.
> > > > Rob?
> > >
> > > I suppose one option would be to split out the patch that adds the
> > > attribute into it's own patch, and merge that both thru drm and iommu?
> > >
> >
> > Ok I can split out domain attr and quirk into its own patch if Will is
> > fine with that approach.
>
> Why don't I just queue the first two patches on their own branch and we
> both pull that?

Ok, that works for me.  I normally base msm-next on -rc1 but I guess
as long as we base the branch on the older or our two -next branches,
that should work out nicely

BR,
-R
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
