Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE406244A4B
	for <lists.iommu@lfdr.de>; Fri, 14 Aug 2020 15:19:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9400E86F0E;
	Fri, 14 Aug 2020 13:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NG488_K8wpdH; Fri, 14 Aug 2020 13:19:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4B1F86CDB;
	Fri, 14 Aug 2020 13:19:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1A55C004D;
	Fri, 14 Aug 2020 13:19:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B8FCC004D
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 13:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 59AAD88C40
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 13:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJkIpy0aS6hZ for <iommu@lists.linux-foundation.org>;
 Fri, 14 Aug 2020 13:19:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8CD5488C3D
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 13:19:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y3so8339319wrl.4
 for <iommu@lists.linux-foundation.org>; Fri, 14 Aug 2020 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tyacguIGHHXsED289fd39lR1bWbtVfQPtH3fTepckZY=;
 b=cpZwP2g/7XZePuqzXyIT+2dWS2vatxuYvpS40kBioWQMZ54CsBv4sHxJuWQwK6YamD
 6+58laePhHIUrnObzWrJ5p89hNnDfHxQ3dyOLaPJ+xCRzg1YMRDWqjA0rJJ4cbtyWWE9
 bmgXfUsCj8+xTBU6Wr5iKXtvh81gkZI4rf8PqE2j5lZtcWwN8g9Mevd6/IXyyobmsR54
 nMSaZFb+mWB5HUejbbZKThI/vCt+0XwU3riqdJpswvU9Sa4vq6C+C1JNXTR057dk7osL
 YnuQoAGsKoPPhvcphq3K+VH9ZvFJ+bIiFCtftVAbPKCcQK46KZEZA51HoKyuJqEbpiUr
 uZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tyacguIGHHXsED289fd39lR1bWbtVfQPtH3fTepckZY=;
 b=Kv4QKyBigKbMXsW15S+wnsBRDPCNQHL4itMulHngXi4J7r5H0jLGYPKUWAD85DkLT/
 8AoEYEWSwNWzyD5qBxh6EYOzYrIHYNf1HWwk+DWj+FclmAxlcUWJ9FRpbiGW9EMTBcTh
 SyMuQwSsl4LUaI4DUSM/9vUNHD6f7itktsogJs1sBuzcXbApcfR+hUSyIBO8Hz3QtRfx
 Yjd2We3u+RRUV1Pq/T1D02bfLnJPw/zX2jRILQn3ZchydVuE1FQfyBj5EbAOFSmEu1Rm
 yBBlOLMRBJ0A3AB9jgSNe40h6uJeC22/kgbvS1W3tUlwLbkKePWuAZwQUpzDJfXktCx7
 t6bw==
X-Gm-Message-State: AOAM530Ki/ySGkAZ8kNItzANwE89aGdClHP1LmGBnB0ycRqlzes8FB1O
 Rs6WmS11MTIMLPnx6gqI3l86qlJOg9QsppxzACOxFA==
X-Google-Smtp-Source: ABdhPJw5Yy1Vffms01Njx5oCbd4CYLl2ai89zPD4KhUODy+zk//A9mZYsRdg5wgrh0cBp+Jjn1J3NcPEufy4cQQGF9s=
X-Received: by 2002:adf:d84f:: with SMTP id k15mr2603518wrl.176.1597411152041; 
 Fri, 14 Aug 2020 06:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200814102625.25599-1-nsaenzjulienne@suse.de>
In-Reply-To: <20200814102625.25599-1-nsaenzjulienne@suse.de>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 14 Aug 2020 18:48:35 +0530
Message-ID: <CAMi1Hd1DzJmqehvxkJ91vr_M_kzdujiHmgyuwUgQYei7VocgZg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] dma-pool fixes
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: lkml <linux-kernel@vger.kernel.org>, jeremy.linton@arm.com,
 iommu <iommu@lists.linux-foundation.org>, linux-rpi-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

On Fri, 14 Aug 2020 at 15:56, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Now that we have an explanation to Amir's issue, we can re-spin this
> series.

Hi, Smoke tested (boots AOSP to UI with Touch/WiFi/BT working) on my
Poco F1 phone, with upstream commit 00e4db51259a (+ 30 odd out of
tree patches [1]) and I see no obvious regressions.

For both the patches in the series:

Tested-by: Amit Pundir <amit.pundir@linaro.org>

[1] https://github.com/pundiramit/linux/commits/beryllium-mainline-display


>
> ---
> Changes since v3:
>  - Do not use memblock_start_of_DRAM()
>
> Changes since v2:
>  - Go back to v1's behavior for patch #2
>
> Changes since v1:
>  - Make cma_in_zone() more strict, GFP_KERNEL doesn't default to true
>    now
>
>  - Check if phys_addr_ok() exists prior calling it
>
> Christoph Hellwig (1):
>   dma-pool: fix coherent pool allocations for IOMMU mappings
>
> Nicolas Saenz Julienne (1):
>   dma-pool: Only allocate from CMA when in same memory zone
>
>  drivers/iommu/dma-iommu.c   |   4 +-
>  include/linux/dma-direct.h  |   3 -
>  include/linux/dma-mapping.h |   5 +-
>  kernel/dma/direct.c         |  13 +++-
>  kernel/dma/pool.c           | 145 +++++++++++++++++++-----------------
>  5 files changed, 92 insertions(+), 78 deletions(-)
>
> --
> 2.28.0
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
