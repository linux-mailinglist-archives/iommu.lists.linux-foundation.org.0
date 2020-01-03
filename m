Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2412F5D3
	for <lists.iommu@lfdr.de>; Fri,  3 Jan 2020 09:57:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3A176214E9;
	Fri,  3 Jan 2020 08:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgeIIjh4eaEz; Fri,  3 Jan 2020 08:57:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3495520117;
	Fri,  3 Jan 2020 08:57:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16830C077D;
	Fri,  3 Jan 2020 08:57:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D2CBC077D
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 08:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BEB387C09
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 08:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKOSAH7-K9RA for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 08:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 27E5A87BC2
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jan 2020 08:57:47 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id b8so41132959edx.7
 for <iommu@lists.linux-foundation.org>; Fri, 03 Jan 2020 00:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r6qIuR+7bvXSiJDqaws/93bA9gUxPMySdOOHdmUI+9c=;
 b=M3turNj3KdsQiVaIqrtUXTiI4fe89dG3LU9vp1KBN9IXfs3u5BftAbcSWQ6LEnUOdw
 h559ZUyPLG3hg7wnXTNSMazKlFl1v/aMoB1tNc+p044Zb89P4u+zSZeSgkjOWnQfyMwV
 Bc8beEs6xwEwpv5P/JQAEtpJUr25kKt8wZyG2XtTdH/gX6AjAXatd7uHk0693/FyENJp
 T3WnbI+7h7S8KWYRT78gr0s6XLp8zKbtJr7EurDd6Iq/krOgPlnTNs5pqAxThsdzBDvB
 HPLOLG55SctAoxGdWRRQpRGnmjQ54ozhnwNX9ANhUaq2OD/raReYkzYZpDSQ8PP+I1JR
 BABA==
X-Gm-Message-State: APjAAAUdKwENtTiU97GPaY1FU4szIgfRZm9my8AJunGECiuXXlGHAUV8
 dmLNSzl4wOjAJbN9XGS2vgE=
X-Google-Smtp-Source: APXvYqyTfPYeweyUs/D/35Bz3a7w+2H8lIK0gttyBHOE77/P2n2tGa1xOmAoP3pGN5h2t8468x1m2g==
X-Received: by 2002:a50:93a2:: with SMTP id o31mr92253605eda.160.1578041865550; 
 Fri, 03 Jan 2020 00:57:45 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id qc1sm5717229ejb.49.2020.01.03.00.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 00:57:44 -0800 (PST)
Date: Fri, 3 Jan 2020 09:57:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 3/3] iommu: Enable compile testing for some of drivers
Message-ID: <20200103081201.GA1439@pi3>
References: <20191230172619.17814-3-krzk@kernel.org>
 <201912311551.tBrb3BhH%lkp@intel.com> <20191231080722.GA6804@pi3>
 <923b1f2f-2b5c-8b6e-6083-243beae09777@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <923b1f2f-2b5c-8b6e-6083-243beae09777@ti.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Thu, Jan 02, 2020 at 04:40:16PM -0600, Suman Anna wrote:
> Hi Krzysztof,
> 
> On 12/31/19 2:07 AM, Krzysztof Kozlowski wrote:
> > On Tue, Dec 31, 2019 at 03:43:39PM +0800, kbuild test robot wrote:
> >> Hi Krzysztof,
> >>
> >> I love your patch! Perhaps something to improve:
> >>
> >> [auto build test WARNING on iommu/next]
> >> [also build test WARNING on v5.5-rc4]
> >> [if your patch is applied to the wrong git tree, please drop us a note to help
> >> improve the system. BTW, we also suggest to use '--base' option to specify the
> >> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >>
> >> url:    https://github.com/0day-ci/linux/commits/Krzysztof-Kozlowski/iommu-omap-Fix-pointer-cast-Wpointer-to-int-cast-warnings-on-64-bit/20191231-022212
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
> >> config: ia64-allmodconfig (attached as .config)
> >> compiler: ia64-linux-gcc (GCC) 7.5.0
> >> reproduce:
> >>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         # save the attached .config to linux build tree
> >>         GCC_VERSION=7.5.0 make.cross ARCH=ia64 
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kbuild test robot <lkp@intel.com>
> > 
> > I saw it already while compile testing my patch. I must admit that I
> > could not find easy/fast fix for it.  Probably the
> > omap_iommu_translate() helper should be made 64-bit friendly but this
> > obfuscates the code. 
> 
> >The driver and hardware supports only 32-bit addresses.
> 
> Yeah, is there a reason why you are trying to enable the build for the
> OMAP IOMMU driver on 64-bit platforms or other architectures - the IP
> and driver is only ever used on ARMv7 platforms, and it should already
> be available for COMPILE_TEST on those.

It's the same reason we enable compile testing on all other drivers
which will never be used outside original platforms. There are many
of such examples because we want to increase the build coverage to as
many different configurations as possible. There could be also another
benefit - easier code reusability - although it is purely theoretical in
this case, I think.

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
