Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 55087234B6D
	for <lists.iommu@lfdr.de>; Fri, 31 Jul 2020 21:04:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C738820516;
	Fri, 31 Jul 2020 19:04:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmAwFGq+88hu; Fri, 31 Jul 2020 19:04:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB325204B5;
	Fri, 31 Jul 2020 19:04:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8D1EC004D;
	Fri, 31 Jul 2020 19:04:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B555AC004D
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 19:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9D631887EB
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 19:04:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16WSE0CH+QI3 for <iommu@lists.linux-foundation.org>;
 Fri, 31 Jul 2020 19:04:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 939D1887E8
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 19:04:31 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t10so12528657plz.10
 for <iommu@lists.linux-foundation.org>; Fri, 31 Jul 2020 12:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SvrDWItWpMJQD19MWKVbok2godg3LX2t3lLGjIRh6r8=;
 b=v8Zyqg+dIshWaliZGw8W5c4/VGIB/I0itzYWvifBZXNnmIlUPX8J6FswIec37vxz9b
 3ql1gCzcRi4gkD6wgwO2+XqKpzM5YlFeoW0VWrW9K0kc7e3xB/dLOJ0gREBqagIyu2bf
 b39uJJm4X/b39OiaKPlCDtkRj/ZQec9qRrZSqDa8UWkvRAANFrs6bB8r9UAt5LTyONdg
 Vjoiy3sgaHzJ5CmY1nH+vNVjTyxDEyJ35aDFYQn/37WIaZZyHsqXV+XzrWtAvM7JguQj
 Mj7VM5L3cq5UxX360aYinM2Iu3FEP2v4Ky3RE1deIHMv0fnUJC1tdSKYi4DfZMyE4HPs
 eJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SvrDWItWpMJQD19MWKVbok2godg3LX2t3lLGjIRh6r8=;
 b=qZBO1PhXpCso+burYSokmhXbAe4GB/5I9ZA7EoS3zMz0c2L6dVkmkAx0dwEqq8ZbE6
 yxbTscg5LxJMX6JuNhMKaa6D0j7SNJuJ6+Myss6sRkYN/KgQQEA7bQlkRqvwpkKzQCmB
 fsGcm5iXBX37hv9lJK4ItjgBRajOl5gLwBKgiZ3+TFuiVuTNnOkajD5aqnFDuAX1QblF
 m+vopyS+sT8XPtMz57efrlrCGhn63kCPVxeoWc/waFvZIvp45/+Av+9JFsF5N2wYXysy
 EV/wMtT12UvhhpwtFrDoBeEdhlqyE5KXVnRe6ss9Pm8y2PtRZj1NOP7iTQLkBvQWDaug
 4G1w==
X-Gm-Message-State: AOAM533EGpZB+YT6oqUAW8jLEp9iMDQen6SnmgdO8duhUijlVNOghQTV
 yzaTZASq/IhtrE6rsd/ClyM0jg==
X-Google-Smtp-Source: ABdhPJzSQSDIv7xllFLfKrdcg/Us7WO7+qxFz5/RYHYj1zhfUKms2m/VAjZQNSXWLKWs4fOnCIVlmw==
X-Received: by 2002:a17:902:820f:: with SMTP id
 x15mr4791281pln.105.1596222270900; 
 Fri, 31 Jul 2020 12:04:30 -0700 (PDT)
Received: from [2620:15c:17:3:4a0f:cfff:fe51:6667]
 ([2620:15c:17:3:4a0f:cfff:fe51:6667])
 by smtp.gmail.com with ESMTPSA id y8sm10022499pjj.17.2020.07.31.12.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 12:04:29 -0700 (PDT)
Date: Fri, 31 Jul 2020 12:04:28 -0700 (PDT)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: dma-pool fixes
In-Reply-To: <20200731130903.GA31110@lst.de>
Message-ID: <alpine.DEB.2.23.453.2007311204010.3836388@chino.kir.corp.google.com>
References: <20200728104742.422960-1-hch@lst.de>
 <CAMi1Hd3=6ZZykF1yx_CChqx71k6T-wj12TzJiz_uJZbwrEtTXw@mail.gmail.com>
 <20200728120716.GA2507@lst.de>
 <CAMi1Hd1c3cNMYg+S5Pwuv30QCdcWJw+QxkWmNP34s3nb+_yUuA@mail.gmail.com>
 <20200728124114.GA4865@lst.de>
 <CAMi1Hd0wpcLVJ41h6gs4H0WEDVpNEs7N=wx+KQ_yRKeSv0kQ9g@mail.gmail.com>
 <20200728153055.GA16701@lst.de>
 <18a3b93cc5ba3e0e39ae1b14759ce31121d54045.camel@suse.de>
 <CAMi1Hd3QNtZVEFUgDprT==wcVHKv6TsvpT3RurVJTDb1op2LnA@mail.gmail.com>
 <CAMi1Hd09EbzOgTU5P4EDS8BQ6J2jFntvyR49BePyAqJ15DBB0Q@mail.gmail.com>
 <20200731130903.GA31110@lst.de>
User-Agent: Alpine 2.23 (DEB 453 2020-06-18)
MIME-Version: 1.0
Cc: Amit Pundir <amit.pundir@linaro.org>, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
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

On Fri, 31 Jul 2020, Christoph Hellwig wrote:

> > Hi Nicolas, Christoph,
> > 
> > Just out of curiosity, I'm wondering if we can restore the earlier
> > behaviour and make DMA atomic allocation configured thru platform
> > specific device tree instead?
> > 
> > Or if you can allow a more hackish approach to restore the earlier
> > logic, using of_machine_is_compatible() just for my device for the
> > time being. Meanwhile I'm checking with other developers running the
> > mainline kernel on sdm845 phones like OnePlus 6/6T, if they see this
> > issue too.
> 
> If we don't find a fix for your platform I'm going to send Linus a
> last minute revert this weekend, to stick to the no regressions policy.
> I still hope we can fix the issue for real.
> 

What would be the scope of this potential revert?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
