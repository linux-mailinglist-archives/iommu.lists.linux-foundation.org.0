Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A828724A544
	for <lists.iommu@lfdr.de>; Wed, 19 Aug 2020 19:53:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 233B287D7F;
	Wed, 19 Aug 2020 17:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYk6a2iUGOkV; Wed, 19 Aug 2020 17:53:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7FC1587D73;
	Wed, 19 Aug 2020 17:53:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52662C0890;
	Wed, 19 Aug 2020 17:53:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDBFFC0051
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C973687D39
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlOusTgHfTHu for <iommu@lists.linux-foundation.org>;
 Wed, 19 Aug 2020 17:24:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4DCB987CC4
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 17:24:24 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id f26so26251683ljc.8
 for <iommu@lists.linux-foundation.org>; Wed, 19 Aug 2020 10:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojSwV7SvqjKQoGPMxqvv0gsrf/RgVZcGIvS7BBup7+g=;
 b=VqmL0RedfzzSImBcYBoGClC2Z6UAihg/BXc1CnhHqoj0eUre8BVYOlCvNPxklLBSgP
 nLwLIR++4Kv0RE3BiZIjFu22n6R2TU8ldYKmSwwnJVI5fpKvaO5Bk8kN2QeVTaDGBaIB
 JecUwHCUkkhy3+ouO37q6Lbgs6Q0YKuzlgzOGSHh8P2qEyQ2n4X8ifsghKJEfdSUpDV2
 II4EPmn9sjsOTLN2W1jvcNyey4oQaTVB5YdxMCK5BE9RakLnb425R7BvQcuqBbQFcvbv
 Fb+Z4pAjirOJ8+ypaGxN3by36PWwpqSyDvhx52C75yHNWJLb1H1DtEBru0XXh4lYXi4r
 pUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojSwV7SvqjKQoGPMxqvv0gsrf/RgVZcGIvS7BBup7+g=;
 b=t1gNsY2n4D/2fvBaBH6U+3uCPWBLAF36N55LFalHrz3s4A579liJXY/6FWsMsbg22E
 95H4gNQZzPWnlSuCv0KU48BaKf//z5PcUvYOh+87Y60QSr0+3SN23lUoBWHRtUByAGIz
 aB17I1IMo3NLtDrJvYLuaz82+0RSc1wvr2GGCsvJCFST3vV8GLGwkao4oH+7cbUrPdqH
 O5t9rNzDGkDuJABfS//6dLk4unC699i2RWGP6hf/UGPuvk3szcSYWzK/xr5RBr+Vsu2b
 9P9p9/Sx82XyUjen+qfB7MZRRdKa598Q/hWvNTDs1Bhi83mQnO4rPKnqQ36Zzqa7uldb
 tV2g==
X-Gm-Message-State: AOAM530NNaiwU480lM/EcQZzYMPiTqdStmu6AkzNmbVbfmZ4mbj7TIah
 9UdBC8Cb7xgEWEQ51KVBdMx0pzEpPR6N71Dh31A=
X-Google-Smtp-Source: ABdhPJwjmNsnMo5isiZXimlZyKlSIpiYa8wlISdAoXklEf5GhXE97QZWwcR2YV+uN3jTPIX0sexyhbE3XCYyFg/tNhQ=
X-Received: by 2002:a2e:9047:: with SMTP id n7mr13443758ljg.125.1597857862328; 
 Wed, 19 Aug 2020 10:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200819171326.35931-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200819171326.35931-1-andriy.shevchenko@linux.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Aug 2020 14:24:10 -0300
Message-ID: <CAOMZO5B9FGqSsnQcw1hhyOQnvkgxXK_xAkvNbjdtNuH+5V8kBA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] swiotlb: Use %pa to print phys_addr_t variables
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 19 Aug 2020 17:53:02 +0000
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-pci@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Hi Andy,

On Wed, Aug 19, 2020 at 2:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> -       unsigned long bytes = io_tlb_nslabs << IO_TLB_SHIFT;
> +       unsigned long mb = (io_tlb_nslabs << IO_TLB_SHIFT) >> 20;

Looks like an unrelated change.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
