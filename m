Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E289C3A1005
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 12:15:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF62404EB;
	Wed,  9 Jun 2021 10:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ByUFjdnq5G2g; Wed,  9 Jun 2021 10:14:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C39B0404E8;
	Wed,  9 Jun 2021 10:14:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92580C0024;
	Wed,  9 Jun 2021 10:14:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 175F2C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 10:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0A36404DC
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 10:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsWIMfTBi95p for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 10:14:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63205404D9
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623233693;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGhpFhVlOYIC5kowMMVAYHo7k0EKPg3F6ebOQuwUO2Q=;
 b=C504YV7lbrdICR/AGvPyity9NMeWbaeTYGswcq9JTa72likGONaNdHNisqRo1ZIRLK48vc
 rfrn5TIcsqLEKxM3kz1lcM/Jfv6X8X3ESB07dPPLXWOrlMbKAOv5joiQmIZHm610vm07uS
 D8st+PxrdZ4VzWeFveITdTUXbqG+INA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-wt8NxAoRPXexnlgeu8K_ZQ-1; Wed, 09 Jun 2021 06:14:52 -0400
X-MC-Unique: wt8NxAoRPXexnlgeu8K_ZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 w3-20020a1cf6030000b0290195fd5fd0f2so1760889wmc.4
 for <iommu@lists.linux-foundation.org>; Wed, 09 Jun 2021 03:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=UGhpFhVlOYIC5kowMMVAYHo7k0EKPg3F6ebOQuwUO2Q=;
 b=tCpMPhC5+syXZ2ixvNFP1EA7f989UH4FgL/lvxsvGN3hOw71CAlhmQqyFfTzzkNYV0
 YtDfbqOCx6gTsEMdmVrQe/ufxeRjUVWJiWiin7l9QSymu++XRsaVAkMEpAoVxBH/Gq9i
 6yUSnAUCTdSbHXAlRkwoJvu/0J3YaoRuJMZewbZiY43GY1edsahebuks3SUcKCVTgd6+
 dTVFuSQ2/slxg/1g1JAwrZ9HYKeRNT80mADzjvqoo6YC/sZk4wam+PgwdwSpvb3MxOUm
 zNhuaE9OnEr8gjuOabF4d/LS40D3HeI/rsuMiizPbfTwgZ5KqAqTL+4lE1GykoETTK/B
 O05w==
X-Gm-Message-State: AOAM533LEodtuMxzajDOy0Z7skU3pL/sinV8Moz2ASLTCP1SRbtbVpRw
 WNI7govSWym9HeZw4KVPzwhWhP+Vtsa4ATSQhOQiKwp/ekuPE4kUnu8ZYGFBJl8SXWbxZAItWcZ
 GRuTt4CTIzKY6EG+Fk+ERvD0TzTp9Tw==
X-Received: by 2002:a05:600c:1d1b:: with SMTP id
 l27mr15988806wms.62.1623233691356; 
 Wed, 09 Jun 2021 03:14:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPzb12xOqzJBjs300yp5Am4sprlPGLIaJs+P2xzrS5KjO/tgbq9Rys/XuEfnxApGxtTlyRzQ==
X-Received: by 2002:a05:600c:1d1b:: with SMTP id
 l27mr15988778wms.62.1623233691155; 
 Wed, 09 Jun 2021 03:14:51 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r3sm4058615wmq.8.2021.06.09.03.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:14:50 -0700 (PDT)
Subject: Re: Plan for /dev/ioasid RFC v2
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "Alex Williamson (alex.williamson@redhat.com)" <alex.williamson@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, "parav@mellanox.com" <parav@mellanox.com>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Shenming Lu <lushenming@huawei.com>
References: <MWHPR11MB188699D0B9C10EB51686C4138C389@MWHPR11MB1886.namprd11.prod.outlook.com>
 <b1bb72b5-cb98-7739-8788-01e36ec415a8@redhat.com>
 <MWHPR11MB1886FEFB5C8358EB65DBEA1A8C369@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <8a3f2bc6-79b7-5dfb-492a-21c0af7b9c2c@redhat.com>
Date: Wed, 9 Jun 2021 12:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886FEFB5C8358EB65DBEA1A8C369@MWHPR11MB1886.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "Jiang, Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
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
Reply-To: eric.auger@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Kevin,

On 6/9/21 11:37 AM, Tian, Kevin wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Wednesday, June 9, 2021 4:15 PM
>>
>> Hi Kevin,
>>
>> On 6/7/21 4:58 AM, Tian, Kevin wrote:
>>> Hi, all,
>>>
>>> We plan to work on v2 now, given many good comments already received
>>> and substantial changes envisioned. This is a very complex topic with
>>> many sub-threads being discussed. To ensure that I didn't miss valuable
>>> suggestions (and also keep everyone on the same page), here I'd like to
>>> provide a list of planned changes in my mind. Please let me know if
>>> anything important is lost.  :)
>>>
>>> --
>>>
>>> (Remaining opens in v1)
>>>
>>> -   Protocol between kvm/vfio/ioasid for wbinvd/no-snoop. I'll see how
>>>     much can be refined based on discussion progress when v2 is out;
>>>
>>> -   Device-centric (Jason) vs. group-centric (David) uAPI. David is not fully
>>>     convinced yet. Based on discussion v2 will continue to have ioasid uAPI
>>>     being device-centric (but it's fine for vfio to be group-centric). A new
>>>     section will be added to elaborate this part;
>>>
>>> -   PASID virtualization (section 4) has not been thoroughly discussed yet.
>>>     Jason gave some suggestion on how to categorize intended usages.
>>>     I will rephrase this section and hope more discussions can be held for
>>>     it in v2;
>>>
>>> (Adopted suggestions)
>>>
>>> -   (Jason) Rename /dev/ioasid to /dev/iommu (so does uAPI e.g. IOASID
>>>     _XXX to IOMMU_XXX). One suggestion (Jason) was to also rename
>>>     RID+PASID to SID+SSID. But given the familiarity of the former, I will
>>>     still use RID+PASID in v2 to ease the discussoin;
>>>
>>> -   (Jason) v1 prevents one device from binding to multiple ioasid_fd's. This
>>>     will be fixed in v2;
>>>
>>> -   (Jean/Jason) No need to track guest I/O page tables on ARM/AMD.
>> When
>>>     a pasid table is bound, it becomes a container for all guest I/O page
>> tables;
>> while I am totally in line with that change, I guess we need to revisit
>> the invalidate ioctl
>> to support PASID table invalidation.
> Yes, this is planned when doing this change.
OK
>
>>> -   (Jean/Jason) Accordingly a device label is required so iotlb invalidation
>>>     and fault handling can both support per-device operation. Per Jean's
>>>     suggestion, this label will come from userspace (when VFIO_BIND_
>>>     IOASID_FD);
>> what is not totally clear to me is the correspondance between this label
>> and the SID/SSID tuple.
>> My understanding is it rather maps to the SID because you can attach
>> several ioasids to the device.
>> So it is not clear to me how you reconstruct the SSID info
>>
> Yes, device handle maps to SID. The fault data reported to userspace
> will include {device_label, ioasid, vendor_fault_data}. In your case
> I believe SSID will be included in vendor_fault_data thus no reconstruct
> required. For Intel the user could figure out vPASID according to device_
> label and ioasid, i.e. no need to include PASID info in vendor_fault_data.
OK that works.

Thanks

Eric
>
> Thanks
> Kevin

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
