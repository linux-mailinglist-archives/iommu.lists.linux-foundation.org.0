Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A30276BFC
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 10:31:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5EBA986FA5;
	Thu, 24 Sep 2020 08:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arAHsgceJkvB; Thu, 24 Sep 2020 08:31:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C3B24874BA;
	Thu, 24 Sep 2020 08:31:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9978C0893;
	Thu, 24 Sep 2020 08:31:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34810C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2CD4E2E0DF
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7lqpyuUEmXE for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:31:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 8AFC72E0DA
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 08:31:36 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id gx22so3300870ejb.5
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iQLky5ZWJdFZQTUOK1fAqSj9E9vn3fC5tbC/RCI+f5o=;
 b=JxmiTewQDn+DVnAHs5YSCKXGT9ubPK/YQGSoDm86k7pdu51akn98y0gMvSdQrAKLVN
 O8mfewLHNsyNzndlhjkcDqtCXCMrX0Ejgi/Dr/u3JJa0kY7fnmGkkhTC8zh6wtROgN3R
 QmGd1E7DNjOrhV3SaSSLohUmmndRJccit3YqqlHXuVhnYphUN0ssoPq9DxEXbgFKGz1p
 VfNeLjJbe3KBnXoYeLJHS5J0+RM77PeCKO5CzxXjhnzO1Lr7AAlm4e3uhH6dHZwyltoo
 VRSbtBnHCu9qkPNJipDLql43zuJgP4lnfr2q2bbMivywCcFILBEMwmOWCOdmuyJeC3LM
 N+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iQLky5ZWJdFZQTUOK1fAqSj9E9vn3fC5tbC/RCI+f5o=;
 b=X3t6sUlEEpdxCAs4oWxebtti6GBFT4xbHf9rGpnUk0P0I5/zt/jjrgf3A/xTHo1n2d
 v4exfWM24I0Xu+Eg7wsbX0942CF5rMLuvPFtKL1zYGuxldJQAUoZNPRuZBGHOUjJ22sg
 C+bnNXqgpny8MwPiDLNG+Snyx1AkpYY6vWcFXZG+IUoiPbwu2YCpp8A1CrA1w4Dcp1Wu
 YdoQ8FnNcVnZkfrPegPojsCIebl1ZMie0h4vBYEWqAKAnlZiGSfCauWicyUoVcBhzdEh
 hIjjl34+QadaTQUlHA/+sSA891YQIfK3fcR3mDh7dWuliuz/NlFjG5cOCII1BmQDG1xR
 xeLg==
X-Gm-Message-State: AOAM532mecdgNVOC91aSra++foRjuv+1ImSPA46SNdfa/yoKbdqjsdL9
 GHiAdsA3IXz035xh4yRy8DPgAQ==
X-Google-Smtp-Source: ABdhPJwLzzXN+IyUsf3KGNT7aZtIbPoxS7jdNw92acn5PhSUI2Uv1RL6H8dlzn8f4ElxNCwc/0DyMA==
X-Received: by 2002:a17:906:2659:: with SMTP id
 i25mr3402228ejc.16.1600936294818; 
 Thu, 24 Sep 2020 01:31:34 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id q23sm1988704edw.41.2020.09.24.01.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 01:31:34 -0700 (PDT)
Date: Thu, 24 Sep 2020 10:31:16 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/6] iommu/virtio: Add topology helpers
Message-ID: <20200924083116.GA170808@myrica>
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200821131540.2801801-3-jean-philippe@linaro.org>
 <21fce247-4c1c-b7a8-bcac-4d7b649eaeca@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21fce247-4c1c-b7a8-bcac-4d7b649eaeca@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, kevin.tian@intel.com, mst@redhat.com,
 linux-pci@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 bhelgaas@google.com, jasowang@redhat.com
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

On Fri, Sep 04, 2020 at 06:22:12PM +0200, Auger Eric wrote:
> > +/**
> > + * virt_dma_configure - Configure DMA of virtualized devices
> > + * @dev: the endpoint
> > + *
> > + * Setup the DMA and IOMMU ops of a virtual device, for platforms without DT or
> > + * ACPI.
> > + *
> > + * Return: -EPROBE_DEFER if the device is managed by an IOMMU that hasn't been
> > + *   probed yet, 0 otherwise
> > + */
> > +int virt_dma_configure(struct device *dev)
> > +{
> > +	const struct iommu_ops *iommu_ops;
> > +
> > +	iommu_ops = virt_iommu_setup(dev);
> > +	if (IS_ERR_OR_NULL(iommu_ops)) {
> > +		int ret = PTR_ERR(iommu_ops);
> > +
> > +		if (ret == -EPROBE_DEFER || ret == 0)
> > +			return ret;
> > +		dev_err(dev, "error %d while setting up virt IOMMU\n", ret);
> > +		return 0;
> why do we return 0 here?

So we can fall back to another method (ACPI or DT) if available

> Besides
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
