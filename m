Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A559D19D250
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 10:35:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 676B4870ED;
	Fri,  3 Apr 2020 08:35:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_2GRD3dl-tG; Fri,  3 Apr 2020 08:35:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 63603870F4;
	Fri,  3 Apr 2020 08:35:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53E2AC1AE2;
	Fri,  3 Apr 2020 08:35:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4121C07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 08:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DA15C870F7
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 08:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4oDKeoSuyR5 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 08:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C8227870ED
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 08:35:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so7469292wrs.3
 for <iommu@lists.linux-foundation.org>; Fri, 03 Apr 2020 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gSDnBtalBGHCeLhjHixwG2yB0Zm9Uo7yHmAg2UgLWeU=;
 b=t1GnrrkQzojg5Ujx4Cx6gRfTF9IbKcMgckidZWrVxH8SZ3YPcQuVNqwXz9IWys1ocf
 nP0Sz58PeL/xyaexdo3oj5Xq17DXktK9Mr6F1pi2PG4PpETrWOhxupj3XMNEohVCevRI
 Zp0apcsoNnq2F3VYkJ318tjg0SZZN6xWy1Uj5Wh9Wqo5v/PQJhxiejM7ZwalDMNJtuAm
 0yyXZPNqtRkAWhfOqoLIbeHsBGeSsvljtVT72J9o3BpItjmn9JDroP/om91tC2QEj5JB
 ow+FeIgaKGa5ajlJIWJtSD/y31uh8MQVhb961019Lf/9or27Z/oHAP0ZDm0A2bynuxMC
 QeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gSDnBtalBGHCeLhjHixwG2yB0Zm9Uo7yHmAg2UgLWeU=;
 b=tkXJemAbFTDj9OHsk4b6d/by2KmZoQSqUSEY47mgOGYGETR3JV5HwlOeLF7FgqzdwB
 uv0k29b1wd45tGkjSWbShrWBy5KsUPJsUKDddm4/AH8IIdiPdvMKHT9wOaPXAKevoa6S
 F/4C9KkCEBUMR/7zj7uhW+yU3jhzcfWDTDUQEuAmZ5hXueVBoERmMDDlNAPAXkbtM7Ho
 KT4JoW6QdUuOej7VTKLGvysRTvVaGWtmrywEMtEK4Ug0GGFzwiGjDIOdTMXVNKjuF4ia
 aMDs9mWsv4wkCNfUcT/WXitZnPqhmZf7n+AwPO1UX4aMwqDaAswN+sw6uN7kj9ipn9Ap
 6nGQ==
X-Gm-Message-State: AGi0Puax3q7D4WXe+qX1fZtrsZpmaA/BzpOLt6EfdI03iTie8BVnNxao
 NH44zgbqDL2bSNg50Hom2G2aGQ==
X-Google-Smtp-Source: APiQypLBXNwvFu6keSYM+miYTrHXIWwYEuTvwr0d2qKOYlQDhXSjNTC9FSVDKnLTWiEvjqmBKIE58A==
X-Received: by 2002:adf:b6a9:: with SMTP id j41mr5268509wre.70.1585902900172; 
 Fri, 03 Apr 2020 01:35:00 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m11sm10720712wmf.9.2020.04.03.01.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 01:34:59 -0700 (PDT)
Date: Fri, 3 Apr 2020 10:34:52 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Yi L Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 6/8] vfio/type1: Bind guest page tables to host
Message-ID: <20200403083407.GB1269501@myrica>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-7-git-send-email-yi.l.liu@intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FF98F@SHSMSX104.ccr.corp.intel.com>
 <A2975661238FB949B60364EF0F2C25743A21D8C6@SHSMSX104.ccr.corp.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D805F75@SHSMSX104.ccr.corp.intel.com>
 <A2975661238FB949B60364EF0F2C25743A21ED01@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A2975661238FB949B60364EF0F2C25743A21ED01@SHSMSX104.ccr.corp.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Tian,
 Jun J" <jun.j.tian@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Thu, Apr 02, 2020 at 08:05:29AM +0000, Liu, Yi L wrote:
> > > > > static long vfio_iommu_type1_ioctl(void *iommu_data,
> > > > >  		default:
> > > > >  			return -EINVAL;
> > > > >  		}
> > > > > +
> > > > > +	} else if (cmd == VFIO_IOMMU_BIND) {
> > > >
> > > > BIND what? VFIO_IOMMU_BIND_PASID sounds clearer to me.
> > >
> > > Emm, it's up to the flags to indicate bind what. It was proposed to
> > > cover the three cases below:
> > > a) BIND/UNBIND_GPASID
> > > b) BIND/UNBIND_GPASID_TABLE
> > > c) BIND/UNBIND_PROCESS
> > > <only a) is covered in this patch>
> > > So it's called VFIO_IOMMU_BIND.
> > 
> > but aren't they all about PASID related binding?
> 
> yeah, I can rename it. :-)

I don't know if anyone intends to implement it, but SMMUv2 supports
nesting translation without any PASID support. For that case the name
VFIO_IOMMU_BIND_GUEST_PGTBL without "PASID" anywhere makes more sense.
Ideally we'd also use a neutral name for the IOMMU API instead of
bind_gpasid(), but that's easier to change later.

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
