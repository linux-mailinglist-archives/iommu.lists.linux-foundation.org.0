Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D9221A9F4
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 23:52:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8353D88483;
	Thu,  9 Jul 2020 21:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQP-74kkbrNW; Thu,  9 Jul 2020 21:52:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83B3E88481;
	Thu,  9 Jul 2020 21:52:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68BE0C016F;
	Thu,  9 Jul 2020 21:52:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ECCBC016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A089689AD1
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 21:51:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VRZ8Vg2JTTB for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 21:51:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3366A89ABD
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 21:51:15 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id f16so1692629pjt.0
 for <iommu@lists.linux-foundation.org>; Thu, 09 Jul 2020 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=yZE59xCL3eBQXoSAxSBT7tm0J2D29/mHRf5l4hrUISI=;
 b=KmKQ4RFjJZN8heHwcunUI+xmSk3O4O7DS/tcqI/shA4R/8tNWpEFDLOaySPCFZvWp0
 pnmJL8xRUDDhptx9Z3jpLMortBNwszOKdCEwWLmCDClzKmP0PfHJTQouFtl9Gwb3UG2t
 Hj5B/OJ3WQZwUBMCrYVBOZrTSHyNr1a9bsFItVX+rEVahrUtcYOaoRxIsg4zx5WoJrtG
 1FaWdcSiC/eqUjRVwPigfrWqMO0M/6VyqMmMndTJ7g49Rr/O6JGgWtJaO1V+gcLr9x+l
 IeEfHITYzSZFf7BWirupcVcL8NQJwun0thCSKLQ2xnWNLiyyqBjTL8foD9POx5zI7Uqp
 VSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=yZE59xCL3eBQXoSAxSBT7tm0J2D29/mHRf5l4hrUISI=;
 b=BMIxJIyzXsz2o9p99mqkl7ARZIElZMMGc4ozdVN+AoRG55gBsyJQgc/70TlR0LGv91
 p/yLiKf5c03u8TYxTKMT/YqRaLPwBqjPTkKLcd1v+aHhU0jDI33+ZOR9mWjM7GbwNCJw
 rAQgQ+WbWimwguWlUf4l0CvyJkaiJVcENN32ycIz76+i26FyytBlK4a7gNRVd4AvQ7dW
 EAApNSv29WAF1KkhzYF00p5q3+SgLEjsf0Not8Iv0uZYXPnEe8IyJ0La/ebWxrWOMUe7
 Pu8mSXRCxYXPya80sCJgUmlIHpcpy+Z7hn4vQ0VK5Oru38ECdN8OshmQhOJ69WK9skgV
 3KNw==
X-Gm-Message-State: AOAM533PJGGrTIG8p6YwydWDJeZbzoJYECVSPNEffLtJUE/Enys+HrLy
 O2TyeF5aZsuEwbQhqyR2EZkNdg==
X-Google-Smtp-Source: ABdhPJw4jj1Ar0xu4SkVS219xhic6hKPDR7al9eAtmxNdCW/w3Vk/zjOX56TAskC31yPRk75GOCl9w==
X-Received: by 2002:a17:90b:283:: with SMTP id
 az3mr2264678pjb.38.1594331474724; 
 Thu, 09 Jul 2020 14:51:14 -0700 (PDT)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667]
 ([2620:15c:17:3:4a0f:cfff:fe51:6667])
 by smtp.gmail.com with ESMTPSA id t126sm3841690pfd.214.2020.07.09.14.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:51:14 -0700 (PDT)
Date: Thu, 9 Jul 2020 14:51:13 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH 2/4] dma-pool: Get rid of dma_in_atomic_pool()
In-Reply-To: <20200709161903.26229-3-nsaenzjulienne@suse.de>
Message-ID: <alpine.DEB.2.23.453.2007091449540.972523@chino.kir.corp.google.com>
References: <20200709161903.26229-1-nsaenzjulienne@suse.de>
 <20200709161903.26229-3-nsaenzjulienne@suse.de>
User-Agent: Alpine 2.23 (DEB 453 2020-06-18)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, hch@lst.de
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
From: David Rientjes via iommu <iommu@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, 9 Jul 2020, Nicolas Saenz Julienne wrote:

> The function is only used once and can be simplified to a one-liner.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

I'll leave this one to Christoph to decide on.  One thing I really liked 
about hacking around in kernel/dma is the coding style, it really follows 
"one function does one thing and does it well" even if there is only one 
caller.  dma_in_atomic_pool() was an attempt to follow in those footsteps.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
