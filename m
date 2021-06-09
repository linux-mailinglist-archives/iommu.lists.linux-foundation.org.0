Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 131EA3A14C6
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 14:46:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CEA40500;
	Wed,  9 Jun 2021 12:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bYrDHo8UQubx; Wed,  9 Jun 2021 12:46:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 81DEA404FF;
	Wed,  9 Jun 2021 12:46:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F4EDC000B;
	Wed,  9 Jun 2021 12:46:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3861FC000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 12:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9AF60888
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 12:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RypmovTj_bAB for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 12:46:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 636C8608C5
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aV8lGXCf4JWxP5wrUtMX1uPufd4NWDA47LRUUqM3gO4=;
 b=Kt87u1GQl8eiQn3TVpPw/se/0HXpcnN+ZHS6M3U633YNGvwghSw2seqDl2YutbIe5Yb5G1
 xsQ1jKQ/gfrfZbjioQZFP3YOC5qWH24lXjzpuqB7gGF4nK4BzXSIPNgZ2whvcg0MiHP2Ca
 OHVX6p54mNe6FaBUx3Fzx0iUP7l4wfo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-hW_ODz9FO_iaaY3uUetGjg-1; Wed, 09 Jun 2021 08:46:11 -0400
X-MC-Unique: hW_ODz9FO_iaaY3uUetGjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so1895092wmq.7
 for <iommu@lists.linux-foundation.org>; Wed, 09 Jun 2021 05:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aV8lGXCf4JWxP5wrUtMX1uPufd4NWDA47LRUUqM3gO4=;
 b=m1R2Vfa2DlTmJFqC2Cbt0L0DWEGXHzLN9EYGIbBNaNoSqyQo5r50q3vaEcft/MLjPs
 3kX1nAC+uvuaK1e8BvsD7UfAX+UCn+BiG9a9EuXFB6jQP0DQVA1R9YyZV+ebdgWbi/Gy
 dpUM6NzBsp6XmvKcV9O3bBNGVsesv7T/ddlN+z7me4x9/lTSHJGK1mqBLsaFZi9l4zTl
 5d/XtcgjQWvW6wbU6J8T7F2P17CgzexhfmRwcYSHOsAiCMICB0DLBDIP9lyFuo47IDyI
 NkcKtsmingAszfgVGaP0ZkpjbpPjjWZoue6dbZytTTwjHbfPQ6Sv9N67FkRTJoUp9Jus
 GNRA==
X-Gm-Message-State: AOAM532KxegWwy6UVKJz70JKDoCicINL9w+/hG7hQSF9RTWYIUbK9k7M
 rSnBl6E5lJWpnlNfzUy2iqhmj65v6mEwviJDwfCihD3VnejZCsQCEDsJWJ4H3USA3wCxS0QlZwo
 9HbXowbYiRsl9902gRjHcsmKxQv85Sg==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr8076539wmq.131.1623242770298; 
 Wed, 09 Jun 2021 05:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzssGJ2TKM/C2YsruUldvJ4psZlR+tiJSwiHUOX3ataMRoMzZVYUZnHCu+koyMrOPAZjrC5IA==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr8076509wmq.131.1623242770063; 
 Wed, 09 Jun 2021 05:46:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k12sm6167589wmr.2.2021.06.09.05.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:46:09 -0700 (PDT)
To: Jason Gunthorpe <jgg@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20210604160336.GA414156@nvidia.com>
 <2c62b5c7-582a-c710-0436-4ac5e8fd8b39@redhat.com>
 <20210604172207.GT1002214@nvidia.com>
 <2d1ad075-bec6-bfb9-ce71-ed873795e973@redhat.com>
 <20210607175926.GJ1002214@nvidia.com>
 <fdb2f38c-da1f-9c12-af44-22df039fcfea@redhat.com>
 <20210608131547.GE1002214@nvidia.com>
 <89d30977-119c-49f3-3bf6-d3f7104e07d8@redhat.com>
 <20210608124700.7b9aa5a6.alex.williamson@redhat.com>
 <MWHPR11MB18861A89FE6620921E7A7CAC8C369@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210609115759.GY1002214@nvidia.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <086ca28f-42e5-a432-8bef-ac47a0a6df45@redhat.com>
Date: Wed, 9 Jun 2021 14:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609115759.GY1002214@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>, Jason Wang <jasowang@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 09/06/21 13:57, Jason Gunthorpe wrote:
> On Wed, Jun 09, 2021 at 02:49:32AM +0000, Tian, Kevin wrote:
> 
>> Last unclosed open. Jason, you dislike symbol_get in this contract per
>> earlier comment. As Alex explained, looks it's more about module
>> dependency which is orthogonal to how this contract is designed. What
>> is your opinion now?
> 
> Generally when you see symbol_get like this it suggests something is
> wrong in the layering..
> 
> Why shouldn't kvm have a normal module dependency on drivers/iommu?

It allows KVM to load even if there's an "install /bin/false" for vfio 
(typically used together with the blacklist directive) in modprobe.conf. 
  This rationale should apply to iommu as well.

Paolo

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
