Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17513CC20
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 19:30:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5EF2187B60;
	Wed, 15 Jan 2020 18:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ITblzXLm0K6; Wed, 15 Jan 2020 18:30:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 145A287B4F;
	Wed, 15 Jan 2020 18:30:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0873FC077D;
	Wed, 15 Jan 2020 18:30:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CD8DC077D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 18:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 05D5185FA3
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 18:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDXu_qKfNe3k for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 18:30:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 90F8585F63
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 18:30:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so1013871wmj.5
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 10:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vx9ZI/rGscUUGCBc0iWif4TA6oe6ecIt71Ef+bzf57U=;
 b=JEN7pX6UGwBqBgRVeU46B89XGheqHUrF69+1A6TQGYjtGYTBLYkKWY2orOVSw8hS/V
 yx7E/7T+8HwIqvdg6/rD8ch2BDnEbEBkwzGS0jNSiN7xOdZTWJCGNpH00b6FmjajImRM
 Y0Cq723LUX5rNaaq68rFRJpBzri8ZTJCpfZZXzuZlACIyqy276ntAuLB5rebtF6KpuK0
 VXsLW7MtFmYWfFQNZ8guFJVTMh0WdkoUrDalt/20pf7BJAKsa7gxBb/6aEtY5v52u+FS
 rJOoE27gKx2D97bW1kHpVoBosfK/GPlAyGR5lt0nUOtflXGNm7+DRO/mgm/UQ7iD4uHu
 TMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vx9ZI/rGscUUGCBc0iWif4TA6oe6ecIt71Ef+bzf57U=;
 b=E4c8rvGstZNlmvUdQ1BuNWO4SSSozli0exQb5zgHKUKgGhFYhAzc1m4G3ZYWlKYIUw
 4C0tGdpwhi17bc4TYsDJoMwOa/DMuRVGwe09PfX1yYwDai8V8v1joAfGTCf2EKzhbvo+
 fEKvjl4raleBvUFGjLUYyBDJGwnXhKL6mBmLK+1ERsxMg5ZzVFRFPdJMTYGj+7/nn4p0
 +TMRrTlMFPaMhlYCYFw6XQ37TLIcaKu00JYe+mvMLsaLW8etgyYbCv3NpffgXBCgGgS/
 8HIT6sJkY301r8mBWDFyTKJn6OUNMuY18cf1mat4QZGOjkmk7LrDJ/vOPusC3F42IyOK
 n55g==
X-Gm-Message-State: APjAAAVFNm+pFcG5DsBe2PFScU997rDN5PC1eGPvph7NFfldWimw4dLy
 rowBJHT9nty8AU0qsnZRfI8e4w==
X-Google-Smtp-Source: APXvYqy8nNtvTuOB8AddkrK/wK0uuvgD1wX9xlx2WFGLj57TQXbAf34VislU15LMhdhXKyk0wQaang==
X-Received: by 2002:a05:600c:21da:: with SMTP id
 x26mr1338398wmj.4.1579113001084; 
 Wed, 15 Jan 2020 10:30:01 -0800 (PST)
Received: from myrica ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id u8sm913472wmm.15.2020.01.15.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 10:30:00 -0800 (PST)
Date: Wed, 15 Jan 2020 19:29:55 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 00/13] iommu: Add PASID support to Arm SMMUv3
Message-ID: <20200115182955.GA152753@myrica>
References: <20200115125239.136759-1-jean-philippe@linaro.org>
 <20200115164255.GB30746@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200115164255.GB30746@willie-the-truck>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, guohanjun@huawei.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Wed, Jan 15, 2020 at 04:42:56PM +0000, Will Deacon wrote:
> On Wed, Jan 15, 2020 at 01:52:26PM +0100, Jean-Philippe Brucker wrote:
> > Since v4 [1] I addressed some of Will's comment.
> 
> Thanks! I've tentatively managed to queue all of this apart from the last
> patch, since that relies on some pasid symbols being exported from the PCI
> core when building the driver as a module with PCI_PASID=y.
> 
> Please can you look at the rest of things here?:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates

Sorry for the delay, I had to rebase and rework the SVA patchset a little
in order to test. Your changes look good to me and run fine on the
hisilicon KunPeng920 (although I haven't tried building as a module yet,
I'll do that next).

Thanks,
Jean

> 
> > Still missing and will be submitted as follow-up patches:
> > * write STE.V with WRITE_ONCE() (patch 7)
> 
> I've hacked that one up myself.
> 
> > * batch submission of CD invalidation (patch 7)
> 
> That can be 5.7 material.
> 
> > * Remove WARN_ON_ONCE() in add_device() (patch 13)
> >   Pending Robin's input.
> 
> I've written that one too, but we'll see what Robin says. The question now
> is which commit do I tag in the branch above :)
> 
> Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
