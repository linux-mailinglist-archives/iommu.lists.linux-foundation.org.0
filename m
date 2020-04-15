Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1621AAB7D
	for <lists.iommu@lfdr.de>; Wed, 15 Apr 2020 17:11:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BD33A85CF0;
	Wed, 15 Apr 2020 15:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DbcOGOEvzSG; Wed, 15 Apr 2020 15:11:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6B76857A4;
	Wed, 15 Apr 2020 15:11:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFAA3C0172;
	Wed, 15 Apr 2020 15:11:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35468C0172
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 15:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CDEB876A0
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 15:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dW-xvDSn8xcX for <iommu@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 15:11:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6676385CDB
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 15:11:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h26so257483wrb.7
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Vzn5Qi0ZG5I2dfN+j2Q0PXBNrTKg5GnbDO72sf5kYmE=;
 b=kZ4BXox0LCjCv71j6mhvSC6hJT0Z/VGQda1i6/OdAyN4W1ETBfMrmBAaUNfak62dI3
 3RgoMqf4NrWAUABEgfHAShe0W9Ugx0uqNG9HBnqOjFxKen/NZrjX0Kb3TvjWgSRd5gs0
 dlJSrbOOrGLjqJ65EYoQ+JQMoKJpmuTUVFeMQiv6GD/OXOuy0ROSiOpexEVW72YZL4ne
 0OEx7p7O1RogVyTytQu6MdFp3uSbs3LBH4q+J6zMCsGLvBXD8XsoV76qaJGgdzoAikzc
 9WM+V67zjUXRTeO4PdviJ4iCQ5dpsQ41nKcBL0kDP0/dwn+24klk82G1y0HwHLzgBR3P
 2+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vzn5Qi0ZG5I2dfN+j2Q0PXBNrTKg5GnbDO72sf5kYmE=;
 b=TGjDVZsgVwMH4EtBPXrcUv9n7uDz+iXLHq40GGKyU+yB3U7Mp8YCxp0J3HTd+5KFsh
 Pk4ccMULszVrmx84BAgPQJ90I5xLBD5GuuB6sBdQm84TNtBH3DaUgNELUj7J+Rnltlxb
 mnjmgwuoXF1ul/TSyZ7ikEyH0YaOaodWjiYbkMGptfccBdEs0QGDpeHh048JZVIQecgj
 guKL39i3JW6MJJ5L0qDQ3SejnASWn5Yroihnr972lB+1epumPsa30nD5QsAcrgAE+jiO
 b29YqjvCw38NHPnP0ouamq6Ny+lrSbEEM/4nUDheGh1ZGAwySqY/T0P/iBd8XKTaJSOk
 UxOw==
X-Gm-Message-State: AGi0PuZXKVvGNh8il/iXWvW7pnEX+jtTNgmXdpBo8gLKHK9Q05G1uh1y
 nMOiyoLFQ3sdss6jKiR3I9bMVA==
X-Google-Smtp-Source: APiQypJ1tKF/+7Bq6w/nAZeilnVQ5/5MxeB23DPP2SO0LzWZkJI3hVp2OiXoJMV4vD1qTUVfbHmQog==
X-Received: by 2002:adf:f844:: with SMTP id d4mr10793811wrq.362.1586963452757; 
 Wed, 15 Apr 2020 08:10:52 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k184sm22809016wmf.9.2020.04.15.08.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 08:10:51 -0700 (PDT)
Date: Wed, 15 Apr 2020 17:10:43 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 05/10] iommu/ioasid: Create an IOASID set for host SVA use
Message-ID: <20200415151043.GB738821@myrica>
References: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585158931-1825-6-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200401135316.GF882512@myrica>
 <20200406083353.73efda5b@jacob-builder>
 <20200407110146.GB285264@myrica>
 <20200413150631.60e54d85@jacob-builder>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200413150631.60e54d85@jacob-builder>
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

On Mon, Apr 13, 2020 at 03:06:31PM -0700, Jacob Pan wrote:
> > > > But quotas are only necessary for VMs, when the host shares the
> > > > PASID space with them (which isn't a use-case for Arm systems as
> > > > far as I know, each VM gets its own PASID space).  
> > > Is there a host-guest PASID translation? or the PASID used by the
> > > VM is physical PASID? When a page request comes in to SMMU, how
> > > does it know the owner of the PASID if PASID range can overlap
> > > between host and guest?  
> > 
> > We assign PCI functions to VMs, so Page Requests are routed with
> > RID:PASID, not PASID alone. The SMMU finds the struct device
> > associated with the RID, and submits the fault with
> > iommu_report_device_fault(). If the VF is assigned to a VM, then the
> > page request gets injected into the VM, otherwise it uses the host
> > IOPF handler
> > 
> Got it, VM private PASID space works then.
> For VM, the IOASID search is within the VM ioasid_set.
> For SVA, the IOASID search is within host default set.
> Should be faster than global search once we have per set xarray.
> I guess the PASID table is per VM instead of per RID (device)? Sorry if
> you already answered it before.

The PASID table is per IOMMU domain, so it's closer to per RID than per
VM, unless userspace puts all devices in the same VFIO container (hence in
the same IOMMU domain).

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
