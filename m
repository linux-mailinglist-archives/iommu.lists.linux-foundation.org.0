Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C322F520F
	for <lists.iommu@lfdr.de>; Wed, 13 Jan 2021 19:31:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B853C84DBD;
	Wed, 13 Jan 2021 18:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEIoWM1zOcaV; Wed, 13 Jan 2021 18:31:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B635B860F9;
	Wed, 13 Jan 2021 18:31:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B548C013A;
	Wed, 13 Jan 2021 18:31:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4443CC013A
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 18:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 347ED872FD
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 18:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIuRlYS7DGG2 for <iommu@lists.linux-foundation.org>;
 Wed, 13 Jan 2021 18:31:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 98188872F8
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 18:31:02 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DITC53014246;
 Wed, 13 Jan 2021 18:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=YOoOep0pk024h/2bWHhsjXFHBpy69Sb9S1p2WaS4vnQ=;
 b=edn14FYhV4Wtex5f4922eYDFYHPFMgSdvqFJ/ni3dN/QeMIWRj7ixboQ6Ftco2FDeoMi
 +f17WE5IBufdiamKMGZy4tcw2KiEQT2fk4ZnsMyIUh1MLEtr5OJ/cyFid1qQXNpZU1yK
 y+Tf4Ct0ngtPRPa6Pi0JQ2jHsSS9qywsEtKEm12TycRrK319ykvWjQQK3fAzLgBhignc
 Z8SunKSyY5tvidfXJinhG7goj10pu6zuPZawm4dLUGJ5affVA+vXcWbicTOQrtvjIA1f
 4dwriN3Es9erI5+H53dV4WPzkx5zbfP1a+rStd3kZhAZhOTolNeSzar7JlmLqjuCdbrF Zw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 360kvk4v21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 18:30:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DIUj36034576;
 Wed, 13 Jan 2021 18:30:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 360keks0c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jan 2021 18:30:53 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DIUkoW028944;
 Wed, 13 Jan 2021 18:30:47 GMT
Received: from anon-dhcp-153.1015granger.net (/68.61.232.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 13 Jan 2021 10:30:46 -0800
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: performance regression noted in v5.11-rc after c062db039f40
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <440CA3AE-BD76-449D-9C66-4A063C8726B2@oracle.com>
Date: Wed, 13 Jan 2021 13:30:43 -0500
Message-Id: <41CD4896-B9AA-43FA-9429-D8703C2CB763@oracle.com>
References: <D81314ED-5673-44A6-B597-090E3CB83EB0@oracle.com>
 <20210112143819.GA9689@willie-the-truck>
 <dfd84bd8-37b3-0f7c-6f38-68f68e8f5b0f@linux.intel.com>
 <440CA3AE-BD76-449D-9C66-4A063C8726B2@oracle.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=986 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=997
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130109
Cc: linux-rdma <linux-rdma@vger.kernel.org>, Will Deacon <will@kernel.org>,
 robin.murphy@arm.com, murphyt7@tcd.ie, iommu@lists.linux-foundation.org,
 logang@deltatee.com, hch@lst.de
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



> On Jan 13, 2021, at 9:07 AM, Chuck Lever <chuck.lever@oracle.com> wrote:
> 
> 
> 
>> On Jan 12, 2021, at 9:25 PM, Lu Baolu <baolu.lu@linux.intel.com> wrote:
>> 
>> Hi,
>> 
>> On 1/12/21 10:38 PM, Will Deacon wrote:
>>> [Expanding cc list to include DMA-IOMMU and intel IOMMU folks]
>>> On Fri, Jan 08, 2021 at 04:18:36PM -0500, Chuck Lever wrote:
>>>> Hi-
>>>> 
>>>> [ Please cc: me on replies, I'm not currently subscribed to
>>>> iommu@lists ].
>>>> 
>>>> I'm running NFS performance tests on InfiniBand using CX-3 Pro cards
>>>> at 56Gb/s. The test is iozone on an NFSv3/RDMA mount:
>>>> 
>>>> /home/cel/bin/iozone -M -+u -i0 -i1 -s1g -r256k -t12 -I
>>>> 
>>>> For those not familiar with the way storage protocols use RDMA, The
>>>> initiator/client sets up memory regions and the target/server uses
>>>> RDMA Read and Write to move data out of and into those regions. The
>>>> initiator/client uses only RDMA memory registration and invalidation
>>>> operations, and the target/server uses RDMA Read and Write.
>>>> 
>>>> My NFS client is a two-socket 12-core x86_64 system with its I/O MMU
>>>> enabled using the kernel command line options "intel_iommu=on
>>>> iommu=strict".
>>>> 
>>>> Recently I've noticed a significant (25-30%) loss in NFS throughput.
>>>> I was able to bisect on my client to the following commits.
>>>> 
>>>> Here's 65f746e8285f ("iommu: Add quirk for Intel graphic devices in
>>>> map_sg"). This is about normal for this test.
>>>> 
>>>> 	Children see throughput for 12 initial writers 	= 4732581.09 kB/sec
>>>> 	Parent sees throughput for 12 initial writers 	= 4646810.21 kB/sec
>>>> 	Min throughput per process 			=  387764.34 kB/sec
>>>> 	Max throughput per process 			=  399655.47 kB/sec
>>>> 	Avg throughput per process 			=  394381.76 kB/sec
>>>> 	Min xfer 					= 1017344.00 kB
>>>> 	CPU Utilization: Wall time    2.671    CPU time    1.974    CPU utilization  73.89 %
>>>> 	Children see throughput for 12 rewriters 	= 4837741.94 kB/sec
>>>> 	Parent sees throughput for 12 rewriters 	= 4833509.35 kB/sec
>>>> 	Min throughput per process 			=  398983.72 kB/sec
>>>> 	Max throughput per process 			=  406199.66 kB/sec
>>>> 	Avg throughput per process 			=  403145.16 kB/sec
>>>> 	Min xfer 					= 1030656.00 kB
>>>> 	CPU utilization: Wall time    2.584    CPU time    1.959    CPU utilization  75.82 %
>>>> 	Children see throughput for 12 readers 		= 5921370.94 kB/sec
>>>> 	Parent sees throughput for 12 readers 		= 5914106.69 kB/sec
>>>> 	Min throughput per process 			=  491812.38 kB/sec
>>>> 	Max throughput per process 			=  494777.28 kB/sec
>>>> 	Avg throughput per process 			=  493447.58 kB/sec
>>>> 	Min xfer 					= 1042688.00 kB
>>>> 	CPU utilization: Wall time    2.122    CPU time    1.968    CPU utilization  92.75 %
>>>> 	Children see throughput for 12 re-readers 	= 5947985.69 kB/sec
>>>> 	Parent sees throughput for 12 re-readers 	= 5941348.51 kB/sec
>>>> 	Min throughput per process 			=  492805.81 kB/sec
>>>> 	Max throughput per process 			=  497280.19 kB/sec
>>>> 	Avg throughput per process 			=  495665.47 kB/sec
>>>> 	Min xfer 					= 1039360.00 kB
>>>> 	CPU utilization: Wall time    2.111    CPU time    1.968    CPU utilization  93.22 %
>>>> 
>>>> Here's c062db039f40 ("iommu/vt-d: Update domain geometry in
>>>> iommu_ops.at(de)tach_dev"). It's losing some steam here.
>>>> 
>>>> 	Children see throughput for 12 initial writers 	= 4342419.12 kB/sec
>>>> 	Parent sees throughput for 12 initial writers 	= 4310612.79 kB/sec
>>>> 	Min throughput per process 			=  359299.06 kB/sec
>>>> 	Max throughput per process 			=  363866.16 kB/sec
>>>> 	Avg throughput per process 			=  361868.26 kB/sec
>>>> 	Min xfer 					= 1035520.00 kB
>>>> 	CPU Utilization: Wall time    2.902    CPU time    1.951    CPU utilization  67.22 %
>>>> 	Children see throughput for 12 rewriters 	= 4408576.66 kB/sec
>>>> 	Parent sees throughput for 12 rewriters 	= 4404280.87 kB/sec
>>>> 	Min throughput per process 			=  364553.88 kB/sec
>>>> 	Max throughput per process 			=  370029.28 kB/sec
>>>> 	Avg throughput per process 			=  367381.39 kB/sec
>>>> 	Min xfer 					= 1033216.00 kB
>>>> 	CPU utilization: Wall time    2.836    CPU time    1.956    CPU utilization  68.97 %
>>>> 	Children see throughput for 12 readers 		= 5406879.47 kB/sec
>>>> 	Parent sees throughput for 12 readers 		= 5401862.78 kB/sec
>>>> 	Min throughput per process 			=  449583.03 kB/sec
>>>> 	Max throughput per process 			=  451761.69 kB/sec
>>>> 	Avg throughput per process 			=  450573.29 kB/sec
>>>> 	Min xfer 					= 1044224.00 kB
>>>> 	CPU utilization: Wall time    2.323    CPU time    1.977    CPU utilization  85.12 %
>>>> 	Children see throughput for 12 re-readers 	= 5410601.12 kB/sec
>>>> 	Parent sees throughput for 12 re-readers 	= 5403504.40 kB/sec
>>>> 	Min throughput per process 			=  449918.12 kB/sec
>>>> 	Max throughput per process 			=  452489.28 kB/sec
>>>> 	Avg throughput per process 			=  450883.43 kB/sec
>>>> 	Min xfer 					= 1043456.00 kB
>>>> 	CPU utilization: Wall time    2.321    CPU time    1.978    CPU utilization  85.21 %
>>>> 
>>>> And here's c588072bba6b ("iommu/vt-d: Convert intel iommu driver to
>>>> the iommu ops"). Significant throughput loss.
>>>> 
>>>> 	Children see throughput for 12 initial writers 	= 3812036.91 kB/sec
>>>> 	Parent sees throughput for 12 initial writers 	= 3753683.40 kB/sec
>>>> 	Min throughput per process 			=  313672.25 kB/sec
>>>> 	Max throughput per process 			=  321719.44 kB/sec
>>>> 	Avg throughput per process 			=  317669.74 kB/sec
>>>> 	Min xfer 					= 1022464.00 kB
>>>> 	CPU Utilization: Wall time    3.309    CPU time    1.986    CPU utilization  60.02 %
>>>> 	Children see throughput for 12 rewriters 	= 3786831.94 kB/sec
>>>> 	Parent sees throughput for 12 rewriters 	= 3783205.58 kB/sec
>>>> 	Min throughput per process 			=  313654.44 kB/sec
>>>> 	Max throughput per process 			=  317844.50 kB/sec
>>>> 	Avg throughput per process 			=  315569.33 kB/sec
>>>> 	Min xfer 					= 1035520.00 kB
>>>> 	CPU utilization: Wall time    3.302    CPU time    1.945    CPU utilization  58.90 %
>>>> 	Children see throughput for 12 readers 		= 4265828.28 kB/sec
>>>> 	Parent sees throughput for 12 readers 		= 4261844.88 kB/sec
>>>> 	Min throughput per process 			=  352305.00 kB/sec
>>>> 	Max throughput per process 			=  357726.22 kB/sec
>>>> 	Avg throughput per process 			=  355485.69 kB/sec
>>>> 	Min xfer 					= 1032960.00 kB
>>>> 	CPU utilization: Wall time    2.934    CPU time    1.942    CPU utilization  66.20 %
>>>> 	Children see throughput for 12 re-readers 	= 4220651.19 kB/sec
>>>> 	Parent sees throughput for 12 re-readers 	= 4216096.04 kB/sec
>>>> 	Min throughput per process 			=  348677.16 kB/sec
>>>> 	Max throughput per process 			=  353467.44 kB/sec
>>>> 	Avg throughput per process 			=  351720.93 kB/sec
>>>> 	Min xfer 					= 1035264.00 kB
>>>> 	CPU utilization: Wall time    2.969    CPU time    1.952    CPU utilization  65.74 %
>>>> 
>>>> The regression appears to be 100% reproducible.
>> 
>> The commit 65f746e8285f ("iommu: Add quirk for Intel graphic devices in
>> map_sg") is a temporary workaround. We have reverted it recently (5.11-
>> rc3). Can you please try the a kernel version after -rc3?
> 
> I don't see a change in write results with v5.11-rc3, but read throughput
> appears to improve a little.
> 
> 
> 	Children see throughput for 12 initial writers 	= 3854295.72 kB/sec
> 	Parent sees throughput for 12 initial writers 	= 3744064.85 kB/sec
> 	Min throughput per process 			=  313499.41 kB/sec 
> 	Max throughput per process 			=  328151.44 kB/sec
> 	Avg throughput per process 			=  321191.31 kB/sec
> 	Min xfer 					= 1001728.00 kB
> 	CPU Utilization: Wall time    3.289    CPU time    2.075    CPU utilization  63.10 %
> 
> 
> 	Children see throughput for 12 rewriters 	= 3692675.22 kB/sec
> 	Parent sees throughput for 12 rewriters 	= 3688975.23 kB/sec
> 	Min throughput per process 			=  304863.84 kB/sec 
> 	Max throughput per process 			=  311000.16 kB/sec
> 	Avg throughput per process 			=  307722.93 kB/sec
> 	Min xfer 					= 1028096.00 kB
> 	CPU utilization: Wall time    3.375    CPU time    2.051    CPU utilization  60.76 %
> 
> 
> 	Children see throughput for 12 readers 		= 4521975.69 kB/sec
> 	Parent sees throughput for 12 readers 		= 4516965.08 kB/sec
> 	Min throughput per process 			=  372762.16 kB/sec 
> 	Max throughput per process 			=  382233.84 kB/sec
> 	Avg throughput per process 			=  376831.31 kB/sec
> 	Min xfer 					= 1022720.00 kB
> 	CPU utilization: Wall time    2.747    CPU time    1.961    CPU utilization  71.39 %
> 
> 
> 	Children see throughput for 12 re-readers 	= 4684127.06 kB/sec
> 	Parent sees throughput for 12 re-readers 	= 4678990.23 kB/sec
> 	Min throughput per process 			=  385586.34 kB/sec 
> 	Max throughput per process 			=  395542.47 kB/sec
> 	Avg throughput per process 			=  390343.92 kB/sec
> 	Min xfer 					= 1022208.00 kB
> 	CPU utilization: Wall time    2.653    CPU time    1.941    CPU utilization  73.16 %

I should also mention that at 65f746e8285f ("iommu: Add quirk for Intel
graphic devices inmap_sg") I didn't measure any throughput regression.
It's the following two commits that introduce the problem.


--
Chuck Lever



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
