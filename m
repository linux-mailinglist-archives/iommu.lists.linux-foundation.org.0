Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A413B3E588E
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 12:47:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEF883474;
	Tue, 10 Aug 2021 10:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S44LUrlaaqxo; Tue, 10 Aug 2021 10:47:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3E90183403;
	Tue, 10 Aug 2021 10:47:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04A58C001F;
	Tue, 10 Aug 2021 10:47:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28849C000E;
 Tue, 10 Aug 2021 10:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171AE40434;
 Tue, 10 Aug 2021 10:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AorLdEJdOW5M; Tue, 10 Aug 2021 10:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 552D8403EA;
 Tue, 10 Aug 2021 10:47:02 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id c9so25585255wri.8;
 Tue, 10 Aug 2021 03:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P7tG0VICffIvt3SyEoitjgLNgYWI+9vAdgdbLXyUgnA=;
 b=NxGLVkg6YqQF7/cLzb6GlfcCFOdCqiir+5zGIgiBUTAF52fO7Tde21cs3wmyp/ltSb
 Hbn3Li59fa/W3pnkxOGhog3SlRTzty/MWdP5JIWvqKsJk4A2yWe4DqpoidZsoHirRDum
 TZZt3zCoRqhjd7kcwj5G5giAXg7sFQ7CWgyt9xzekgS0m3hmMW328+nEIyTq/tatlIXp
 +samUTGqEVeg5oF2TCjL2LHCxRy/r2qK4R21jR/adQQWWMzP+ST7R/NXS19p680nd/0i
 tnUMsAOKs52NrAKdEiPQx4D+ipB4eGTTn9tVHD+g0xMja5hQi/dBRSRcASuOp9iddrJi
 SPCA==
X-Gm-Message-State: AOAM531MZAwp/1SkZ1FdUm+vey9OehoGfzbjsBs35meiE0jZS02VQTjH
 3YFQCv85b4zHXuQdlAHsgC8=
X-Google-Smtp-Source: ABdhPJyDKXzP8lYVFrOox2qWqjvBfpvQiZ3S0ftoHgefJvAa1EpMTslpm9umKEz0v5yx8wvyyBexAA==
X-Received: by 2002:a5d:4852:: with SMTP id n18mr6810873wrs.10.1628592420511; 
 Tue, 10 Aug 2021 03:47:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r8sm899528wmn.0.2021.08.10.03.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:47:00 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:46:58 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Praveen Kumar <kumarpraveen@linux.microsoft.com>
Subject: Re: [RFC v1 5/8] mshv: add paravirtualized IOMMU support
Message-ID: <20210810104658.5ir7cibalhy3roun@liuwe-devbox-debian-v2>
References: <20210709114339.3467637-1-wei.liu@kernel.org>
 <20210709114339.3467637-6-wei.liu@kernel.org>
 <77670985-2a1b-7bbd-2ede-4b7810c3e220@linux.microsoft.com>
 <20210803214718.hnp3ejs35lh455fw@liuwe-devbox-debian-v2>
 <562f4c31-1ea5-ea56-ac0a-6bd80b61c3df@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <562f4c31-1ea5-ea56-ac0a-6bd80b61c3df@linux.microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, pasha.tatashin@soleen.com,
 Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Aug 04, 2021 at 12:13:42PM +0530, Praveen Kumar wrote:
> On 04-08-2021 03:17, Wei Liu wrote:
> >>> +static size_t hv_iommu_unmap(struct iommu_domain *d, unsigned long i=
ova,
> >>> +			   size_t size, struct iommu_iotlb_gather *gather)
> >>> +{
> >>> +	size_t unmapped;
> >>> +	struct hv_iommu_domain *domain =3D to_hv_iommu_domain(d);
> >>> +	unsigned long flags, npages;
> >>> +	struct hv_input_unmap_device_gpa_pages *input;
> >>> +	u64 status;
> >>> +
> >>> +	unmapped =3D hv_iommu_del_mappings(domain, iova, size);
> >>> +	if (unmapped < size)
> >>> +		return 0;
> >> Is there a case where unmapped > 0 && unmapped < size ?
> >>
> > There could be such a case -- hv_iommu_del_mappings' return value is >=
=3D 0.
> > Is there a problem with this predicate?
> =

> What I understand, if we are unmapping and return 0, means nothing was
> unmapped, and will that not cause any corruption or illegal access of
> unmapped memory later?  From __iommu_unmap

Those pages are not really unmapped. The hypercall is skipped.

> ...
>     13         while (unmapped < size) {
>     12                 size_t pgsize =3D iommu_pgsize(domain, iova, size =
- unmapped);
>     11
>     10                 unmapped_page =3D ops->unmap(domain, iova, pgsize,=
 iotlb_gather);
>      9                 if (!unmapped_page)
>      8                         break;		<<< we just break here, thinking t=
here is nothing unmapped, but actually hv_iommu_del_mappings has removed so=
me pages.
>      7
>      6                 pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
>      5                         =A6iova, unmapped_page);
>      4
>      3                 iova +=3D unmapped_page;
>      2                 unmapped +=3D unmapped_page;
>      1         }
> ...
> =

> Am I missing something ?
> =

> Regards,
> =

> ~Praveen.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
