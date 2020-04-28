Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC3E1BCD98
	for <lists.iommu@lfdr.de>; Tue, 28 Apr 2020 22:41:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30325835F0;
	Tue, 28 Apr 2020 20:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnwQ3dcIuxg0; Tue, 28 Apr 2020 20:41:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1559B80351;
	Tue, 28 Apr 2020 20:41:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6BCAC0172;
	Tue, 28 Apr 2020 20:41:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E9D3C0172
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 20:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 00586204A3
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 20:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iG7n5TzvmjWW for <iommu@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:41:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id A936620467
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588106471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4eENH6tB0EGZ/BA2dzhb17ThkK45wZijHpRT5Rx0P7Q=;
 b=XGrwQTpu8pFriydV1NgZDH0yBZpe9wwndwTZClFps71bZnTf7NG9BkbtrFytEmF/aBJbOv
 pAIStCYapt0TkY8Ye4VlR86LXPitdO4QNZNCJ3c38LWX9osQQux3XiVEEOGDd9AEW4Jt3L
 xXZBp9/KC+kC3d8njgpvXgrbOoAKix8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-icMrv83xMm6phR9XWpCyOw-1; Tue, 28 Apr 2020 16:41:09 -0400
X-MC-Unique: icMrv83xMm6phR9XWpCyOw-1
Received: by mail-wr1-f70.google.com with SMTP id r11so44053wrx.21
 for <iommu@lists.linux-foundation.org>; Tue, 28 Apr 2020 13:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4eENH6tB0EGZ/BA2dzhb17ThkK45wZijHpRT5Rx0P7Q=;
 b=AoG5iF2MoRKxHgfyAaj8aRD1Z6v9LQnP2EWunBaF73xvuCwzNiawKNuSgzJNYsP9vt
 i/LLrc39Ew9CPXiqXrp2F1bMEFlB6m0vPYZVmcYfTi1B5AkqDeq4ZU8GxHIQW/WCwoZK
 WboClG975j33yRPu234sDO9QIYZRgMKhhl4LwpCsA0aPbOS1D+2wG3K7VE0K9Ocf8HHE
 L5K+IXPevt8d6SYh4zBNjVu7YncAcefcoB9HFet/1I7sYsgWm7rcxE4HLxKKu9ElqCR3
 1IMaoznT30vjOwLG3JxsmhpNU+Pjllh+uUXe2vwRWe4Iuxa4eRmHeLn0I5iLx3iI/5xi
 v0Kw==
X-Gm-Message-State: AGi0PublMxEX9o/DAV7p9/41C/G9zxq8GYaACydWdPUmgFzeLg67NKxh
 vOKhMm31VfPMzraQcixCko99PsKYqWSuIA2W0n8Rop6Fi5piHgYFeB9ECkyRKQfSR+WfyKTBGh3
 p9vtZNsR97k94cvSnrA1RcV96ShOohw==
X-Received: by 2002:adf:a3d5:: with SMTP id m21mr35941295wrb.54.1588106468374; 
 Tue, 28 Apr 2020 13:41:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ29J3wRFwAKcd5VfgZy6d80BpVLKwPqj7y7vEzsoMHleANkL6oMYbQYlmbWERgm90rIizbxg==
X-Received: by 2002:adf:a3d5:: with SMTP id m21mr35941287wrb.54.1588106468180; 
 Tue, 28 Apr 2020 13:41:08 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 33sm27359373wrp.5.2020.04.28.13.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 13:41:07 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:41:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200428163448-mutt-send-email-mst@kernel.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20200428174952.GA5097@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, jasowang@redhat.com,
 christoffer.dall@arm.com, virtualization@lists.linux-foundation.org,
 alex.bennee@linaro.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, will@kernel.org, linux-kernel@vger.kernel.org,
 pratikp@codeaurora.org
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

On Tue, Apr 28, 2020 at 11:19:52PM +0530, Srivatsa Vaddagiri wrote:
> * Michael S. Tsirkin <mst@redhat.com> [2020-04-28 12:17:57]:
> 
> > Okay, but how is all this virtio specific?  For example, why not allow
> > separate swiotlbs for any type of device?
> > For example, this might make sense if a given device is from a
> > different, less trusted vendor.
> 
> Is swiotlb commonly used for multiple devices that may be on different trust
> boundaries (and not behind a hardware iommu)?

Even a hardware iommu does not imply a 100% security from malicious
hardware. First lots of people use iommu=pt for performance reasons.
Second even without pt, unmaps are often batched, and sub-page buffers
might be used for DMA, so we are not 100% protected at all times.


> If so, then yes it sounds like a
> good application of multiple swiotlb pools.
> 
> > All this can then maybe be hidden behind the DMA API.
> 
> Won't we still need some changes to virtio to make use of its own pool (to
> bounce buffers)? Something similar to its own DMA ops proposed in this patch?

If you are doing this for all devices, you need to either find a way
to do this without chaning DMA ops, or by doing some automatic change
to all drivers.


> > > +void virtio_bounce_set_dma_ops(struct virtio_device *vdev)
> > > +{
> > > +	if (!bounce_buf_paddr)
> > > +		return;
> > > +
> > > +	set_dma_ops(vdev->dev.parent, &virtio_dma_ops);
> > 
> > 
> > I don't think DMA API maintainers will be happy with new users
> > of set_dma_ops.
> 
> Is there an alternate API that is more preffered?

all this is supposed to be part of DMA API itself. new drivers aren't
supposed to have custom DMA ops.

> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
