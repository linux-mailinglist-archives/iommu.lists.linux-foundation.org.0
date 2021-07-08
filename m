Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4693C14BD
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 15:57:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818FC60ADD;
	Thu,  8 Jul 2021 13:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7s8RRL4CVwT; Thu,  8 Jul 2021 13:57:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9176A60AD0;
	Thu,  8 Jul 2021 13:57:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C249C000E;
	Thu,  8 Jul 2021 13:57:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B33EC000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 13:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9782160AE2
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 13:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVKsMdrj-bZn for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 13:57:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7481960AD0
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 13:57:13 +0000 (UTC)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kai.heng.feng@canonical.com>) id 1m1UWd-0005KX-PA
 for iommu@lists.linux-foundation.org; Thu, 08 Jul 2021 13:57:11 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 e3-20020a0564020883b029039ef9536577so1836142edy.5
 for <iommu@lists.linux-foundation.org>; Thu, 08 Jul 2021 06:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VtIU2Y6iPu0EP7ecFsyW91ksyJ0R/0bAhIVleyNgs7A=;
 b=c5Cz9Fioqy7BoAN1+QIydL/YRpsca2ZE6cawbPII3YDJ6GRF5dWls0rT5Mu3HRUbRq
 ioJUBV+eg7Y0Oy39rhbPHt3cXYm5DqIMzbk4QY5i/eTJO1MP+gu8cf3Z2qBIpwZ9B4Ya
 AHHYvd80qOPz0slJmKJJvBTTAuC651o0pcpBwy/PI0Xbid4QUFQIYM21bGNA3uun9CeO
 O3n3NvBQutJmoLzwFloHvjYS0KaOGhs7g4UG+Q+RiCg64jSa+1yu0nAGpLH/MNiG3ru3
 ZK5ZJK1Lm6+FjgzfOVxh29cvUOFUeh4vbBD2uAXMNiuVuhKY3zABcmk9egcbfkjt/kih
 6m6A==
X-Gm-Message-State: AOAM530egLU+IomonHkEO7F8DMSoFyxbmD7qN2KupW76j0dlL9/uYm5m
 fihH7Rvt/cXxlsy3ektAZh5YEHeOqXBY2jGj/MOGFEdbLQi9g6VJ3a6siN7oe0tR7gPjTnnEVa3
 0C0smepzsxvAjcfpu9O51zaNA4lMroq74m4MYAnA5OYMf0d+wEdjrcgns4W+xfeM=
X-Received: by 2002:aa7:c9d8:: with SMTP id i24mr38792922edt.79.1625752631446; 
 Thu, 08 Jul 2021 06:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbEeaHzN2wQKJ0MMMpDpph/5LvO8vkiIk5tQ+ewCrGeoVn6/+g1A8arKaePkuWRXHnP0W7jZzWZnxOGx/aRCE=
X-Received: by 2002:aa7:c9d8:: with SMTP id i24mr38792888edt.79.1625752631156; 
 Thu, 08 Jul 2021 06:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210708074232.924844-1-kai.heng.feng@canonical.com>
 <YObFJREB9/JlcNZP@8bytes.org> <fde11cec-d1bd-49be-f129-c69a973d1b3b@arm.com>
In-Reply-To: <fde11cec-d1bd-49be-f129-c69a973d1b3b@arm.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 8 Jul 2021 21:57:00 +0800
Message-ID: <CAAd53p40RcG0oeYr9QAKMjYRtyq7he=d_b_a39n4Rt5JSVScRQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/amd: Enable swiotlb if any device supports iommu v2
 and uses identity mapping
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 8, 2021 at 6:18 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-07-08 10:28, Joerg Roedel wrote:
> > On Thu, Jul 08, 2021 at 03:42:32PM +0800, Kai-Heng Feng wrote:
> >> @@ -344,6 +344,9 @@ static int iommu_init_device(struct device *dev)
> >>
> >>              iommu = amd_iommu_rlookup_table[dev_data->devid];
> >>              dev_data->iommu_v2 = iommu->is_iommu_v2;
> >> +
> >> +            if (dev_data->iommu_v2)
> >> +                    swiotlb = 1;
> >
> > This looks like the big hammer, as it will affect all other systems
> > where the AMD GPUs are in their own group.
> >
> > What is needed here is an explicit check whether a non-iommu-v2 device
> > is direct-mapped because it shares a group with the GPU, and only enable
> > swiotlb in this case.
>
> Right, it's basically about whether any DMA-limited device might at any
> time end up in an IOMMU_DOMAIN_IDENTITY domain. And given the
> possibility of device hotplug and the user being silly with the sysfs
> interface, I don't think we can categorically determine that at boot time.
>
> Also note that Intel systems are likely to be similarly affected (in
> fact intel-iommu doesn't even have the iommu_default_passthough() check
> so it's probably even easier to blow up).

swiotlb is enabled by pci_swiotlb_detect_4gb() and intel-iommu doesn't
disable it.

I wonder if we can take the same approach in amd-iommu?

Kai-Heng

>
> Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
