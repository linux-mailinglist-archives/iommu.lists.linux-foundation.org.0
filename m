Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210B19AD3D
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 15:59:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 221D585EF9;
	Wed,  1 Apr 2020 13:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kt0FUojwp3cF; Wed,  1 Apr 2020 13:59:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A3B1985F8D;
	Wed,  1 Apr 2020 13:59:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C3ECC089F;
	Wed,  1 Apr 2020 13:59:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44AA9C089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C90485F8D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnV2IqUlnXxo for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 13:58:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 37AF585EF9
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 13:58:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h15so127404wrx.9
 for <iommu@lists.linux-foundation.org>; Wed, 01 Apr 2020 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d3ubFjm4VVzuezD9K57VpIO57fRHdUfHFre4oE4/E04=;
 b=LXbULbcGmfMrHy9dOLNhW1kZDtfZBIl5/lz1iQa7oPRNngMcEJOD5l9icOrmOO3Djy
 EQqlHxTtbMGEE8mA6x2XBw2ECgbR9y6ZS1rqlC2xQfsHBjipC9cadM0uKuyexhvN0x93
 k80wEGBoqIiMrvi008KAnbEGbOywRBQBtrc6WJuf+RJTwHbrfp2xJ3ES2Blh9aaeV7MF
 sn5MWYTVT5jYkU50jZkgvTOzplUoQyJAZAAIRnuqgZIrY7YroC14n05NDSNQzdewB6oe
 m4jvH2JQRvBUQFqQV2RVjStv4Za6RmY7silH4dWxTZawFm1cPOKC6+mQDGBZAe7TTLko
 lODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d3ubFjm4VVzuezD9K57VpIO57fRHdUfHFre4oE4/E04=;
 b=HmV5gGL4VOCX1h0iVjenvfHrtQ88gqD0WO+9L4z3kjhLviDsH7BHg+PMo+GGtxTSxX
 Gcr5Sd2fKQPaFa+toa4RX+9NQCmVvkXwi+shc3MNY60YdSUWYgjCRHK+1h1GlivWf2P3
 LRRK5Pw2G23wYAXUVemN+qBTY4jq4VmhZFJbyrpanh8QCr4EQQOfWvMjPdeYTYa5af8R
 eLKsIWYRCkO43Hm+qdHleLHkWvUxaHtvdTqEaVaPXmsnFe++xvIK915EItySj25Y4oLQ
 /ZXz3pzcklrCdeQoZUM4TShvN1paVXipcBwMeBClEVRVY6kHOSEnKgOkuBi/AWd6EJfk
 n7cA==
X-Gm-Message-State: ANhLgQ3Uy5f7btm3HaZ32EZc3TixoWb3qFzhMluVaGQmCYHFGlkidr0m
 Bma7Zwzjw+M+7kAiAnqRjJwRmA==
X-Google-Smtp-Source: ADFU+vthmbr5J9ido3XqSuHL53iktFkKp5Zjtb6yGwfjf/rGGcpxQjJ5+XEG6T8A4hs6VdpG9JxD2w==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr6915157wro.404.1585749536778; 
 Wed, 01 Apr 2020 06:58:56 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:6097:1406:6470:33b5])
 by smtp.gmail.com with ESMTPSA id a186sm2734787wmh.33.2020.04.01.06.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 06:58:56 -0700 (PDT)
Date: Wed, 1 Apr 2020 15:58:48 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 07/10] iommu/ioasid: Use mutex instead of spinlock
Message-ID: <20200401135848.GH882512@myrica>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-8-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585158931-1825-8-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

On Wed, Mar 25, 2020 at 10:55:28AM -0700, Jacob Pan wrote:
> Each IOASID or set could have multiple users with its own HW context
> to maintain. Often times access to the HW context requires thread context.
> For example, consumers of IOASIDs can register notification blocks to
> sync up its states. Having an atomic notifier is not feasible for these
> update operations.
> 
> This patch converts allocator lock from spinlock to mutex in preparation
> for IOASID notifier.

Unfortunately this doesn't work for SVA, which needs to call ioasid_free()
from the RCU callback of mmu_notifier_put(), which cannot sleep. We're
relying on MMU notifers this way to ensure that there is a single IOASID
per mm.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
