Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D9D2AE4E0
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 01:25:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A92B086747;
	Wed, 11 Nov 2020 00:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8W+Tz7UPqNjr; Wed, 11 Nov 2020 00:25:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29D7386769;
	Wed, 11 Nov 2020 00:25:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11999C016F;
	Wed, 11 Nov 2020 00:25:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4098EC016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 00:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2863B8719C
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 00:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ci2AUeEejcfC for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 00:25:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68375870E5
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 00:25:10 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id cw8so316638ejb.8
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 16:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2O6LIbW3W1fyPRRz6Q2ugAoXMb1CF9Vg+VkIYIaeEto=;
 b=lzTpU0r87pk4y6h34io+WvlgUIGcBLyA7ro331I4mTZJeLaJR4TA//cDV8W5J/BQUY
 ND4Rxi7HVlG6Isz9aIu+NiblYCN/AMdvIG+p3HcHSRb2rg3mXcJTNf1cNykx8kLNh6o9
 Ey7hiKYbqRCeTosc4zpX2vFY3z1AQLirY2i35nYzgh09Ef+VZYJeT1WmQNsCHYTS7hhk
 VqdzzAMc6EdY9cIb1hgG9h7zpbamGZ64NZJaKiFJQ1fo/EP+1N+oAyUvpfKNQk0sORWL
 gXHJHu9WbxjxEp8y4Lokg7Rrxjk3iq0h2A7LEi9PYUKwAmpjJ6UFadkPBP36DMA8zJZw
 n65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2O6LIbW3W1fyPRRz6Q2ugAoXMb1CF9Vg+VkIYIaeEto=;
 b=a9RzoX108JWNweRkDjCmhUQmlkoYI5sAMS+2dH03g2gdu24Li2m9Ziks2sYYnOEmJs
 AgMFngzNOWrHSxC+Ww/D/AwNQ5XG0FmTrq6cp5PMRgW+MdxyS4x/3dCFdtsE0F9ovLpJ
 akZWjJbepl7nqgbaklkTwr+m2c3h6725Z05mEyni60vbT/BlsTcSVVMjUUB9iYYd3wgx
 bRlcM3FxMvR4vtFBPYle0Z47iYDvMpntxv3S3u/SOekGvBXd6vcgup0l3TQxaG9l89aB
 +CCSshg24tJzm0L/SUeAhpnkpBgPQoV1mZuaqh0mXT80gDSThFWeV0f18xv6Km1o4sxV
 wd2w==
X-Gm-Message-State: AOAM531e+XEtC7FPR5J+rJyTHVxPzaczPIfW+QRn/YkDnti/ddindISc
 87N2WqVg2cm/BE4a+a39EhAlDaxRC5CLj4JYDn4=
X-Google-Smtp-Source: ABdhPJx/VNilzppU5AdybE2mXkG021YFimA/sh9NK/KQLMFJ2kNYiaoe2MndQR0ypFROirBkv0XJ87TjyrWs9dDvZxQ=
X-Received: by 2002:a17:906:b312:: with SMTP id
 n18mr23363538ejz.353.1605054308883; 
 Tue, 10 Nov 2020 16:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20201110071908.3133-1-zhenzhong.duan@gmail.com>
 <4cfa1f1827e0ccbfbc94de3beba64a4a141b2248.camel@linux.intel.com>
In-Reply-To: <4cfa1f1827e0ccbfbc94de3beba64a4a141b2248.camel@linux.intel.com>
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date: Wed, 11 Nov 2020 08:24:52 +0800
Message-ID: <CAFH1YnMb0MB+-hg7KWEzpGc_bUAv0UhR4_zBn4Sh8T3zjDMKuw@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/vt-d: avoid unnecessory panic if iommu init fail
 in tboot system
To: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Cc: tboot-devel@lists.sourceforge.net, x86@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, ning.sun@intel.com,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Lukasz,

On Tue, Nov 10, 2020 at 11:53 PM Lukasz Hawrylko
<lukasz.hawrylko@linux.intel.com> wrote:
>
> Hi Zhenzhong
>
> On Tue, 2020-11-10 at 15:19 +0800, Zhenzhong Duan wrote:
> > "intel_iommu=off" command line is used to disable iommu but iommu is force
> > enabled in a tboot system for security reason.
> >
> > However for better performance on high speed network device, a new option
> > "intel_iommu=tboot_noforce" is introduced to disable the force on.
> >
> > By default kernel should panic if iommu init fail in tboot for security
> > reason, but it's unnecessory if we use "intel_iommu=tboot_noforce,off".
> >
> > Fix the code setting force_on and move intel_iommu_tboot_noforce
> > from tboot code to intel iommu code.
> >
> > Fixes: 7304e8f28bb2 ("iommu/vt-d: Correctly disable Intel IOMMU force on")
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
> > ---
> > v2: move ckeck of intel_iommu_tboot_noforce into iommu code per Baolu.
>
> I have check it on my TXT testing environment with latest TBOOT,
> everything works as expected.

Thanks very much for help checking, may I have your Tested-by?

Zhenzhong
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
