Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 508BE17756C
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 12:45:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E3BC886462;
	Tue,  3 Mar 2020 11:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id af6n9FRVsgcV; Tue,  3 Mar 2020 11:45:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D78486456;
	Tue,  3 Mar 2020 11:45:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8692C1D89;
	Tue,  3 Mar 2020 11:45:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA220C013E
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 11:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B3B9486F5C
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 11:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAfW1RtXaA-n for <iommu@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 11:45:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B681B86F1B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Mar 2020 11:45:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j16so3958609wrt.3
 for <iommu@lists.linux-foundation.org>; Tue, 03 Mar 2020 03:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PZ26SY4OwzsSrrvvDGgwwk0/Jl3p0EnMD6uJWZM6hTo=;
 b=Os41xsdyARcThMKgbHdgjT2+ry+sDNsiEi589q5nCVRho3STC+L29GGxO7sHC3e8mR
 +DAjmJXd+wBqZoeuUGQ8IfRJ48h7xqleIj9yg2t3x6sEaZjLp5+8uR/M69QtkqCLZmjB
 5n8viie8sqPIAQv/el8Cu2RHEevc3PnyAk+WKwjd7N72EO/PmDcplEzStoeeQXpTBd+B
 zfRLNNZFj6pgVODZ62JI9IxMFgP86GXWT9mVSe4OzNNIkcutBUlneGzQGtPujn3Tdhfk
 1G5BM85dir9NDY07dZk8lt6CEKfsyf/B7f4J5D74lvlB/MqFZqRi3bR/uEa3D6amHtMi
 DtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PZ26SY4OwzsSrrvvDGgwwk0/Jl3p0EnMD6uJWZM6hTo=;
 b=gdBO4t+c8LnnvLLZ/qGhsDXtlh9diJDFQwjFWDfHjPh/aDtoXG9s96+G+oXAqM5bTY
 EePn7Sb3PXLy8lrwkEgm9tolawEQn2+GBD9ltnurEVD/0b4z71qFRNqJZQXLJ0DqwkLk
 ptKkR7U+MjpYMR7bWVERHLueXMVL10QhGhvLYK8yswg+27O/phDwEl07m87QpH9tUt3v
 cg9eoqpVeJZTXCD5TkD98te3s5t4BasdDKqe3QHRVkcQyJgueuoUOg350HTrSDaUkRMJ
 91xP0IoTHcracyZe4C5yX2vBY8N4y7k9SyW+Ccbtdh2I/stVc8SMpmBIbZJ2lG1cWKeR
 nRtA==
X-Gm-Message-State: ANhLgQ25IeNMJeXKDAWeSeKxeHbyRH771VocgDvOLhYAZKHVMJYSDHx0
 1QSsErbXwxxBEx5PD21kJOSDPQ==
X-Google-Smtp-Source: ADFU+vvAQcjhLmXZmUStTMU0McPCavF6iV/MgepVuImdgSSkgWiW5gBhUK4eC9HXObGd07iarLeZ4g==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr5422393wrx.182.1583235918023; 
 Tue, 03 Mar 2020 03:45:18 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id a7sm3510943wmb.0.2020.03.03.03.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 03:45:17 -0800 (PST)
Date: Tue, 3 Mar 2020 12:45:10 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Raj, Ashok" <ashok.raj@linux.intel.com>
Subject: Re: [PATCH v12 2/4] uacce: add uacce driver
Message-ID: <20200303114510.GA584461@myrica>
References: <1579097568-17542-1-git-send-email-zhangfei.gao@linaro.org>
 <1579097568-17542-3-git-send-email-zhangfei.gao@linaro.org>
 <20200224182201.GA22668@araj-mobl1.jf.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224182201.GA22668@araj-mobl1.jf.intel.com>
Cc: francois.ozog@linaro.org, dave.jiang@intel.com,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ilias.apalodimas@linaro.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Jerome Glisse <jglisse@redhat.com>, grant.likely@arm.com,
 "haojian . zhuang" <haojian.zhuang@linaro.org>,
 linux-accelerators@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 Zhangfei Gao <zhangfei.gao@linaro.org>, Ashok Raj <ashok.raj@intel.com>,
 Kenneth Lee <liguozhu@hisilicon.com>, guodong.xu@linaro.org,
 kenneth-lee-2012@foxmail.com
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

On Mon, Feb 24, 2020 at 10:22:02AM -0800, Raj, Ashok wrote:
> Hi Kenneth,
> 
> sorry for waking up late on this patchset.
> 
> 
> On Wed, Jan 15, 2020 at 10:12:46PM +0800, Zhangfei Gao wrote:
> [... trimmed]
> 
> > +
> > +static int uacce_fops_open(struct inode *inode, struct file *filep)
> > +{
> > +	struct uacce_mm *uacce_mm = NULL;
> > +	struct uacce_device *uacce;
> > +	struct uacce_queue *q;
> > +	int ret = 0;
> > +
> > +	uacce = xa_load(&uacce_xa, iminor(inode));
> > +	if (!uacce)
> > +		return -ENODEV;
> > +
> > +	q = kzalloc(sizeof(struct uacce_queue), GFP_KERNEL);
> > +	if (!q)
> > +		return -ENOMEM;
> > +
> > +	mutex_lock(&uacce->mm_lock);
> > +	uacce_mm = uacce_mm_get(uacce, q, current->mm);
> 
> I think having this at open time is a bit unnatural. Since when a process
> does fork, we do not inherit the PASID. Although it inherits the fd
> but cannot use the mmaped address in the child.

Both the queue and the PASID are tied to a single address space. When it
disappears, the queue is stopped (zombie state) and the PASID is freed.
The fd is not usable nor recoverable at this point, it's just waiting to
be released.

> If you move this to the mmap time, its more natural. The child could
> do a mmap() get a new PASID + mmio space to work with the hardware.

I like the idea, as it ties the lifetime of the bond to that of the queue
mapping, but I have two small concerns:

* It adds a lot of side-effect to mmap(). In addition to mapping the MMIO
  region it would now create both the bond and the queue. For userspace,
  figuring out why the mmap() fails would be more difficult.

* It forces uacce drivers to implement an mmap() interface, and have MMIO
  regions to share. I suspect it's going to be the norm but at the moment
  it's not mandatory, drivers could just implement ioctls ops.

I guess the main benefit would be reusing an fd after the original address
space dies, but is it a use-case?

I'd rather go one step further in the other direction, declare that an fd
is a queue and is exclusive to an address space, by preventing any
operation (ioctl and mmap) from an mm other than the one that opened the
fd. It's not natural but it'd keep the kernel driver simple as we wouldn't
have to reconfigure the queue during the lifetime of the fd.

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
