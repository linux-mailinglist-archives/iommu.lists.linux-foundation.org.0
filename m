Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE313E50B0
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 03:41:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5B074015B;
	Tue, 10 Aug 2021 01:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhRvOxFLNmg2; Tue, 10 Aug 2021 01:41:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 81F4A400F8;
	Tue, 10 Aug 2021 01:41:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5D25AC000E;
	Tue, 10 Aug 2021 01:41:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 512F0C000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 01:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3482B607B0
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 01:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSLN9titAgX6 for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 01:41:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C58160795
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 01:41:21 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id 14so20717902qkc.4
 for <iommu@lists.linux-foundation.org>; Mon, 09 Aug 2021 18:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jSSgod6BCV7HGeJ5Sg1uN+xOqGDa0ESfr2yf+KMt7Os=;
 b=NT/EZu4AHorIdqU60o5QtGc0fMe6Cl77W5uoGWCbmy3ERIZoZRDfnOIbarE2J19l/g
 p24uY2gVC58VBwUWJnDHQfpoQEionBEllQiSB3mrnXXZUemE3PNmfV31/1RlOaKOu4i1
 3+/6ayglaF33MVtaBcdh8R5AdL5+V1uD+B64M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jSSgod6BCV7HGeJ5Sg1uN+xOqGDa0ESfr2yf+KMt7Os=;
 b=lG+/H3DLoI2abdWxXsAvfNWkZD2/EEbhRSv759jABvm5/sob9CnAiWDCGcIOovC5Vv
 chVTOOxJJ8qIkmZ1MAaTNHs9jUfIxHQNTOg70lWeJXdPa/xbKbqIeds/Vma7fHkW0ZJj
 d83NvfxJ1+scHP7hVk7Uin58DyvDoLnbd/QkeiNYs6P06PDl4SIpuv8eorEkeRer1t+4
 vKgTeUmInu9iqa0kUU5PDN94h78hZ0Vmeuvs8wlht/1AcwLVzEXKTxTxJnooR4r1B53S
 kBoT+gy7u8r9Xegxr2U8Q6KIxTcP6ABvIFKiC++laGXF15gwOFkO7J0z/db7wS/FsWAF
 7cUw==
X-Gm-Message-State: AOAM533dkdZV3bnJzWTNEt8yC+U1K2prCZ84clOdFUZIwwIq/7Ie83VT
 CFyqtSYIVBj0BX5HaiCqyJRFKZXqiPpwQOs1EnSdiw==
X-Google-Smtp-Source: ABdhPJw5ifiTMQJbxsCLosZIdWLAslKoKuYfUEpFwa4RjWeDGob+kedEk35Si9WAeU7uq0r2wGpPeY2GJZlIe3lYBq8=
X-Received: by 2002:a37:6d8:: with SMTP id 207mr12046983qkg.328.1628559680048; 
 Mon, 09 Aug 2021 18:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210806103423.3341285-1-stevensd@google.com>
 <20210806103423.3341285-4-stevensd@google.com>
 <PH0PR11MB48241565DC7BF06AD01301D3CDF79@PH0PR11MB4824.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB48241565DC7BF06AD01301D3CDF79@PH0PR11MB4824.namprd11.prod.outlook.com>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 10 Aug 2021 10:41:08 +0900
Message-ID: <CAD=HUj57PENg8-nbp6oR_+Kxqzkp7rZhXi_JBJ8+_v3w4L=4Hw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dma-iommu: bounce buffers for untrusted devices
To: "Mi, Dapeng1" <dapeng1.mi@intel.com>
Cc: Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Aug 10, 2021 at 10:19 AM Mi, Dapeng1 <dapeng1.mi@intel.com> wrote:
>
> Hi David,
>
> I like this patch set and this is crucial for reducing the significant vIOMMU performance. It looks you totally rewrite the IOMMU mapping/unmapping part and use the dynamically allocated memory from buddy system as bounce buffer instead of using the legacy SWIOTLB bounce buffer. As I know, some legacy devices' DMA could not access the memory larger than 32-bit memory space and the dynamically allocated memory address could exceed the 32-bit memory space. Is it a problem?

My understanding is that when devices with that sort of limitation sit
behind an IOMMU, the IOVA is what matters, not the physical address.
The bounce bounce buffers use the same limits for IOVA allocation as
the regular dma-iommu path, so compatible IOVAs will be allocated for
the bounce buffers.

-David

> Thx,
> Dapeng Mi
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
