Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 69912116EE9
	for <lists.iommu@lfdr.de>; Mon,  9 Dec 2019 15:30:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 97A3F88184;
	Mon,  9 Dec 2019 14:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-CtvZAT7fVv; Mon,  9 Dec 2019 14:30:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1992C87F71;
	Mon,  9 Dec 2019 14:30:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 014BAC1D84;
	Mon,  9 Dec 2019 14:30:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 399B1C0881
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 14:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 234088770A
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 14:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-7+h01Gh4T0 for <iommu@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 14:30:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4DC0C875B4
 for <iommu@lists.linux-foundation.org>; Mon,  9 Dec 2019 14:30:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c9so16438127wrw.8
 for <iommu@lists.linux-foundation.org>; Mon, 09 Dec 2019 06:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NeSOszbdzMHZ/+V+DXHgL9D0mGEhlUmwe1+TLdJX008=;
 b=qvElZseBJewplGTPo0n+8CwC9MoBi/YuvUm/YIg2rvJ5sQKd3/6BDuasaswB6HWiqi
 ZqiTfhk2kVkdBYB2JlAQIgGKM2ukVLoXjhBIoIPNi+5Oq33fuQW7K8op+DTlAdNzULyC
 k0RVL3Uc/zP0fqdQP2LDyyIc3AeUc2Na3Z/2V26JX7XHXuFGH3/dLMdrQI/ukMcd8njM
 dZ2nhWN/1VZAMT/FWqJI5q53j/4Ougfu9PZ9S6cv3uDesNzzoe8apAjO4LyjkMB1k8FL
 o4xrbAuf3NtAHwUqpm+tSef3GNnaAf3Y0wIOlYoRvWThfDe8267wjzL3sh0L5WknhZmj
 RwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NeSOszbdzMHZ/+V+DXHgL9D0mGEhlUmwe1+TLdJX008=;
 b=lHoAAf9UC9u6lkn0VEs//GZZCGAkQRmC7K0jfpPeENoaj4Bp+1caYCallTxw/u4WA+
 R6fg99a03v1QcvThCmL3TLe9uhOt/RyIVSAqrwg9dVeyjvsrSo+rcFOc/wUiKn388PNK
 R+piWPYoQlKE6RchMQo13RM6FcBXqPnqHOQUI59W2zxahydFqLsnmZwqrD7Eh6C217Wc
 UmatcJpiYMB9xtZ53Gb0Kn7OtXwyI2g8/D0o25ETuY5yYgqTmGXTSM9Xbh0KwsNf5pl9
 56evxX8YgI7SsZzM33Ssx96agsv8PDKKSiLN6x6V8nn/Z3MBkynfBrd8Ri9jq2SComJg
 Az8A==
X-Gm-Message-State: APjAAAXbsGcTQ7BXdEP6CNeEnULk6XyyosJHFeV2ThTtB7AQtDeQr8uK
 W20xOzDglDZdrOB5hERfmRmM+A==
X-Google-Smtp-Source: APXvYqyXQVDgocdPKAmmXr6bPRuCbLsxMycM/ehx9dgGbZd5gzvpBy6+4TSjivEc6cViM42u04PclA==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr2634374wrs.276.1575901820587; 
 Mon, 09 Dec 2019 06:30:20 -0800 (PST)
Received: from myrica (adsl-62-167-101-88.adslplus.ch. [62.167.101.88])
 by smtp.gmail.com with ESMTPSA id i127sm14487825wma.35.2019.12.09.06.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:30:20 -0800 (PST)
Date: Mon, 9 Dec 2019 15:30:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Map MSI doorbell with iommu_map_atomic()
Message-ID: <20191209143016.GA86761@myrica>
References: <20191209123825.137391-1-jean-philippe@linaro.org>
 <c44950e6-648c-3f71-9f12-d70d17de9f4a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c44950e6-648c-3f71-9f12-d70d17de9f4a@arm.com>
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de
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

On Mon, Dec 09, 2019 at 12:55:22PM +0000, Robin Murphy wrote:
> On 09/12/2019 12:38 pm, Jean-Philippe Brucker wrote:
> > Since commit 781ca2de89ba ("iommu: Add gfp parameter to
> > iommu_ops::map"), iommu_map() might sleep. iommu_dma_get_msi_page() runs
> > in atomic context and thus should call iommu_map_atomic() instead.
> 
> Spooky... I'm rebasing my local branches and this arrived at the exact
> moment I came across my fix[1] that I'd otherwise forgotten about. As
> covered there, this really doesn't need to be atomic at all now, so I'd
> prefer to see it cleaned up more thoroughly.
> 
> Robin.
> 
> [1] https://lore.kernel.org/linux-iommu/5af5e77102ca52576cb96816f0abcf6398820055.1571245656.git.robin.murphy@arm.com/

Oh right I did see it back then, but forgot about it. Much better than my
patch and it fixes my boot splats (and doesn't raise any new lockdep
warning either).

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
