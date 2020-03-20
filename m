Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7D18CA92
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 10:43:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E7DB320346;
	Fri, 20 Mar 2020 09:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wek0HVfRPZlx; Fri, 20 Mar 2020 09:43:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1834922851;
	Fri, 20 Mar 2020 09:43:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F4032C07FF;
	Fri, 20 Mar 2020 09:43:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E107C07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4CDDC8723D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aUH01H9RfFlp for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 09:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 22C3E86BEC
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 09:43:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h9so6561942wrc.8
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lYxvjXA9SuRqdZ2yHHpJOFiSDlizNvxYxQBAXFzGsQM=;
 b=AN0/jotY82HkOV40gcAtQ6S/IqIUIIOT0kFkdTYMalnn8PgFiMqhSgdS4obDDhJv/d
 VK6mkXj5WYfZ6uDDyCSyns/IuVPNHC7APKVKGC5BZqIGehAvyMXND3T0SwVY4uotygYC
 HYESDVGXpZ6PW4rU1oTHLRVwExmqzGaTG4R14+9DiQt9lQziGrNBkhSu1jz3HuMxh9FM
 gdoVDBZFI5YAyKVqgEAGej7HEWqxZbj2MAnhktqo+mdY+gvdf2SRLThr9a2YCNJmN0Te
 eC4mWE14h7Ttk3kgfN/CJ0lVdA5Aa/G06NCdpSu5AMd6CEL66UmrGqTLHrEVE69T1hGY
 bKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lYxvjXA9SuRqdZ2yHHpJOFiSDlizNvxYxQBAXFzGsQM=;
 b=U5cGx3pTwZEecjMYKj+vs3YbIRgKRUJ8zQt6f18UlQu3FGVr6zi8Utrmtep3o1Evfy
 WtPNlgB810G6ZqhS+OQ4SPOdOBFbh4ptikk0x+2GamZGqDcjBXuvBNu7VvJTXGrmO7m7
 1/nauvfXi8qqLxWt7/OU4tNOcttkNRTxlR6U6YJ4kSQ6We9Fgqe/OsvygyaIRxTE98H2
 oDMEe2cKq/bT7VtFsbAaLTS9GJUh1ZWVlaE8kVuliBmXpKrEjpJnJ5nooP7QEj+JeYdM
 gdkbW46ow5NqAlwf7r8hsuCu0D6TuNH8ShVzxEoaEzMTwBqnM5pxcdmislAWnt6LUwp2
 k2+g==
X-Gm-Message-State: ANhLgQ11JgrnyMNtsq2hJXdF6i4Lzv9YxvedY+oEruqE2gATxSP5SG+Z
 TGccPe15Z5J/lgCB5lkBY8qGOA==
X-Google-Smtp-Source: ADFU+vs0OaE+k3p1TmQgvJ0/q3PZZxrH9T9K2EGNdAaKfRF6SRtzcOgiqRgrusNm3EepCULGlvNNJw==
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr9264279wrt.33.1584697415630; 
 Fri, 20 Mar 2020 02:43:35 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n1sm7532148wrj.77.2020.03.20.02.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 02:43:35 -0700 (PDT)
Date: Fri, 20 Mar 2020 10:43:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH 2/2] iommu/vt-d: Replace intel SVM APIs with generic SVA
 APIs
Message-ID: <20200320094328.GC1702630@myrica>
References: <1582586797-61697-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1582586797-61697-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200320092955.GA1702630@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320092955.GA1702630@myrica>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
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

On Fri, Mar 20, 2020 at 10:29:55AM +0100, Jean-Philippe Brucker wrote:
> > - success:
> > -	*pasid = svm->pasid;
> > +success:
> > +	sdev->pasid = svm->pasid;
> > +	sdev->sva.dev = dev;
> > +	if (sd)
> > +		*sd = sdev;
> 
> One thing that might be missing: calling bind() multiple times with the
> same (dev, mm) pair should take references to the svm struct, so device
> drivers can call unbind() on it that many times.

Please disregard this, I missed sdev->users

Thanks,
Jean

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
