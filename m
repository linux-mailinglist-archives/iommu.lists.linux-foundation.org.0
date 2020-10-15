Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 044BD28F5EC
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 17:33:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36C57887E0;
	Thu, 15 Oct 2020 15:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6HRn+OvnX1O; Thu, 15 Oct 2020 15:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 213AA88763;
	Thu, 15 Oct 2020 15:33:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06073C0051;
	Thu, 15 Oct 2020 15:33:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8683C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 15:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A5A3B20494
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 15:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ex5+f3EBI4uV for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 15:33:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 1FD8020444
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 15:33:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y12so4036929wrp.6
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 08:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=JHfVR15DmgNgHjEYT1vHwaXoRgLm3lEWzxDvCcdq+eU=;
 b=YEzGkNPjcWsWogVWz3QWffFRGWZD9E6EKg864hpltYi9b25EGfehPGSZVBj1A+HMl1
 j79R9ryf8zrnmqi0v/SQKYh1CmueM5n9KdXPS6jZ8h7VxeCUl0XNMmKQbHYbqdoAcoSQ
 sYr1eA+AINxBZHMZawO8PinHCVnFYxphvWYxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=JHfVR15DmgNgHjEYT1vHwaXoRgLm3lEWzxDvCcdq+eU=;
 b=tCAe+uNM2Bs3DItvp/KMNXOBUsfuxBIZafnbfqiiAdesdHf4SPatkoGMcMY6IJkr0R
 ww9ggmlLRsbYrW4i1HmWgikLrjFRFe3bSYUYF6KL7idvMJBndReTjrfd4AHUhKks7w/m
 OA1fkc0bc3MGOn067F7QCZ+b5ORZNMyOxCu1slKEaWIV2GHh7eepNopwqGmJ0cbLJWNf
 fIisYKdfSBj02W1z2IH3fXRVmNCHVmUltw7AHj5mRVicH6ufayJKKA8DZ2ZngFn+7cJt
 nJ8veNJPuQeI0ZXfRhoJGVaV2A1SqDqhoJAVcE074dTzDOBTVq4vlNPbOrx4WfwrVYzm
 bEeQ==
X-Gm-Message-State: AOAM530W3nKZyz6rPR3Z++/siBrxMWaPh7q54rgQclxqscUzfuqb6TBE
 5l03BVbaxP4JEWE2aSkSmdEPlQ==
X-Google-Smtp-Source: ABdhPJxZCtmOKvSHGMFu6M0SWndoPtrJKa9skPbxfjCh46ReSVVuskA1W6sLt8/JDmwyo0CIUMDZFQ==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr4957151wrc.420.1602776017257; 
 Thu, 15 Oct 2020 08:33:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j101sm5918352wrj.9.2020.10.15.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 08:33:36 -0700 (PDT)
Date: Thu, 15 Oct 2020 17:33:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
Message-ID: <20201015153334.GF438822@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
 <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org>
 <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org>
 <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org>
 <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
 <20201015065532.GA15371@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015065532.GA15371@infradead.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org
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

On Thu, Oct 15, 2020 at 07:55:32AM +0100, Christoph Hellwig wrote:
> On Tue, Oct 13, 2020 at 02:42:38PM +0100, Robin Murphy wrote:
> > I still think this situation would be best handled with a variant of
> > dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> > automatically when attaching to an unmanaged IOMMU domain.
> 
> dma_ops_bypass should mostly do the right thing as-is.  swiotlb bouncing
> is triggered of two things:
> 
>  1) the dma_mask.  This is under control of the driver, and obviously
>     if it is too small for a legit reason we can't just proceed

Somewhat related, but is there a way to tell the dma-api to fail instead
of falling back to swiotlb? In many case for gpu drivers it's much better
if we fall back to dma_alloc_coherent and manage the copying ourselves
instead of abstracting this away in the dma-api. Currently that's "solved"
rather pessimistically by always allocating from dma_alloc_coherent if
swiotlb could be in the picture (at least for ttm based drivers, i915 just
falls over).
-Daniel

>  2) force_dma_unencrypted() - we'd need to do an opt-out here, either
>     by a flag or by being smart and looking for an attached iommu on
>     the device
> 
> > That way the
> > device driver can make DMA API calls in the appropriate places that do the
> > right thing either way, and only needs logic to decide whether to use the
> > returned DMA addresses directly or ignore them if it knows they're
> > overridden by its own IOMMU mapping.
> 
> I'd be happy to review patches for this.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
